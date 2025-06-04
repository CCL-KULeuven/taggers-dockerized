source dev.env
#docker compose --env-file dev.env up spacy-nl spacy-en spacy-fr spacy-de lettuce-nl-mono lettuce-nl-xlm lettuce-de-mono lettuce-de-xlm lettuce-fr-mono lettuce-fr-xlm lettuce-en-mono lettuce-en-xlm

#docker compose --env-file dev.env up lettuce-nl-mono lettuce-nl-mono lettuce-nl-xlm lettuce-en-xlm lettuce-en-mono spacy-nl
docker compose --env-file dev.env up lettuce-nl-xlm lettuce-nl-mono spacy-nl