# standard
import os
import time
from datetime import timedelta
import warnings


# third-party
import stanza

# suppress futurewarning for stanza:
# /usr/local/lib/python3.12/site-packages/stanza/models/tokenization/trainer.py:82: FutureWarning: You are using `torch.load` with `weights_only=False` (the current default value), which uses the default pickle module implicitly. It is possible to construct malicious pickle data which will execute arbitrary code during unpickling (See https://github.com/pytorch/pytorch/blob/main/SECURITY.md#untrusted-models for more details). In a future release, the default value for `weights_only` will be flipped to `True`. This limits the functions that could be executed during unpickling. Arbitrary objects will no longer be allowed to be loaded via this mode unless they are explicitly allowlisted by the user via `torch.serialization.add_safe_globals`. We recommend you start setting `weights_only=True` for any use case where you don't have full control of the loaded file. Please open an issue on GitHub for any issues related to this experimental feature.

warnings.simplefilter(action='ignore', category=FutureWarning)

# The extension of output files produced by the tagger.
OUTPUT_EXTENSION = ".conllu"

# Expected throughput in chars per sec.
# The timeout and expected job duration are based on this,
# so set it to a lower value to increase the timeout.
PROCESSING_SPEED = 370  # todo: measure this!

nlp = None

def init() -> None:
    """
    Any initialization the tagger may need before processing.
    """
    global nlp
    print("running initialization")
    stanza_model = os.getenv("STANZA_LANG")
    nlp = stanza.Pipeline(
            lang=stanza_model,
            processors="tokenize,mwt,pos,lemma,ner,depparse",
            use_gpu=False,
    )


def process(in_file: str, out_file: str) -> None:
    """
    Process the file at path "in_file" and write the result to path "out_file".
    """
    t_start = time.time()
    with open(out_file, "x", encoding="utf-8") as f_out:
        with open(in_file, "r", encoding="utf-8") as f_in:
            doc = f_in.read()
            result = nlp(doc)
            f_out.write("{:C}".format(result))
            f_out.write("\n")
    print("process completed in {}".format(str(timedelta(seconds=time.time() - t_start))))
