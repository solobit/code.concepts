natural = require("natural")
classifier = new natural.BayesClassifier()

# Corpus

classifier.addDocument("i am long qqqq", "buy")
classifier.addDocument("buy the q's", "buy")
classifier.addDocument("short gold", "sell")
classifier.addDocument("sell gold", "sell")

classifier.train();

console.log classifier.classify("i am short silver")


console.log classifier.classify("i am long copper")


console.log classifier.getClassifications "i am long copper"

classifier.addDocument ["sell", "gold"], "sell"

classifier.save "classifier.json", (err, classifier) ->



natural.BayesClassifier.load "classifier.json", null, (err, classifier) ->
    console.log classifier.classify("long SUNW")
    console.log classifier.classify("short SUNW")


classifier = new natural.BayesClassifier()
classifier.addDocument(["sell", "gold"], "sell")
classifier.addDocument(["buy", "silver"], "buy")

raw = JSON.stringify(classifier)
restoredClassifier = natural.BayesClassifier.restore(JSON.parse(raw))
console.log restoredClassifier.classify("i should sell that")
