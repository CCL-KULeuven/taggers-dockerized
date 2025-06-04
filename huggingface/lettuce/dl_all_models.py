from transformers import pipeline

langs = ["nl", "fr", "en", "de"]
variants = ["xlm", "mono"]
for lang in langs:
    for variant in variants:
        tagger = pipeline("token-classification", 
                          model=f"pranaydeeps/lettuce_pos_{lang}_{variant}", 
                          aggregation_strategy="first")