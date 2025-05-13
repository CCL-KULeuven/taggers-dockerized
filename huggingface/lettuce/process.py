from transformers import pipeline
import os
import re
import time
import spacy
from spacy.language import Language
from spacy_conll import init_parser
from datetime import timedelta

"""
Initialize the tagger if needed and process input files by calling the specific tagger implementation 
and ensuring the output is written to the expected file.
"""

# The extension of output files produced by the tagger.
OUTPUT_EXTENSION = ".conllu"

# Expected throughput in chars per sec.
# The timeout and expected job duration are based on this,
# so set it to a lower value to increase the timeout.
PROCESSING_SPEED = 370 # todo: measure this!

tagger = None
nlp = None

def get_spacy_model():
 spacy_mapping_dict = {"en": "en_core_web_sm",
                       "nl": "nl_core_news_sm",
                       "de": "de_core_news_sm",
                       "fr": "fr_core_news_sm"}
 return spacy_mapping_dict[os.environ["HUGGINGFACE_MODEL"][24:26]]

    
def get_pos_tags(text):
    mono_tags = tagger(text)
    #convert back to original text
    mono_tags = [(text[each['start']:each['end']], each['entity_group']) for each in mono_tags]
    #if there are multiple words in the same tag, we need to split them and copy the tag
    tags = []
    for word, tag in mono_tags:
        word.strip()
        if ' ' in word:
            words = word.split(' ')
            for w in words:
                tags.append((w, tag))
        else:
            tags.append((word, tag))
    return tags
    
def normalize_whitespace(f_in) -> list[str]:
    # uniform whitespace
    # because tagger might contain tabs, resulting in a tsv with illegal extra tabs
    regex = re.compile(r"\s+")
    return [
        regex.sub(" ", line).strip() for line in f_in if not line.isspace() and line
    ]

def to_conllu(token, tag, token_index):
    return (
        str(token_index),
        token,
        "_",
        "_",
        tag if tag else "_",
        "_",
        "_",
        "_",
        "_",
        "_",
    )



def init() -> None:
    """
    Any initialization the tagger may need before processing.
    """
    global nlp
    nlp = spacy.load(get_spacy_model(), enable=('tok2vec', 'parser'))
    nlp.add_pipe("conll_formatter", last=True, config={"disable_pandas": True})
    print("loaded spacy model:", get_spacy_model())

    global tagger
    tagger = pipeline("token-classification", model=os.environ["HUGGINGFACE_MODEL"], aggregation_strategy="first")
    print("loaded huggingface model:", os.environ["HUGGINGFACE_MODEL"])

def process(in_file: str, out_file: str) -> None:
    """
    Process the file at path "in_file" and write the result to path "out_file". 
    """
    t_start = time.time()
    with open(out_file, "w+", encoding="utf-8") as f_out:
        with open(in_file, "r", encoding="utf-8") as f_in:
            # only non empty lines if not xml
            doc = (normalize_whitespace(f_in))
            results = nlp.pipe(doc)
            sent_id = 1
            for result in results:
                for sent in result.sents:
                    tokenized_sent = " ".join([token.text for token in sent])
                    f_out.write(f"# sent_id = {sent_id}\n")
                    f_out.write(f"# text = {tokenized_sent}\n")
                    tags = get_pos_tags(tokenized_sent)
                    for token_index, (token, tag) in enumerate(tags):
                        f_out.write("\t".join(to_conllu(token, tag, token_index + 1)))
                        f_out.write("\n")  # Tokens on newline
                    f_out.write("\n")  # sentence separator
                    sent_id += 1
    print("process completed in {}".format(str(timedelta(seconds=time.time() - t_start))))
   

