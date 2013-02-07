natural = require("natural")
TfIdf = natural.TfIdf
tfidf = new TfIdf()
tfidf.addDocument "this document is about node."
tfidf.addDocument "this document is about ruby."
tfidf.addDocument "this document is about ruby and node."
tfidf.addDocument "this document is about node. it has node examples"
console.log "node --------------------------------"
tfidf.tfidfs "node", (i, measure) ->
  console.log "document #" + i + " is " + measure

console.log "ruby --------------------------------"
tfidf.tfidfs "ruby", (i, measure) ->
  console.log "document #" + i + " is " + measure

