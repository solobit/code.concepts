There are several ways to create a json schema:

* use online schema generator from a actual / stub data set
* find them online at (gov/w3) organizations web sites
* hand-craft them (need expertise)

Sometimes you have data first, usually first in mind anyway. So the first option
is probably easiest but it's not the one with the most constraints e.g. you will
get a very permissive data model in terms of what it excepts. Also without
repetition it will be hard for any automated tool to recognize patterns and thus
not be able to accurately say what values are allowed/expected/required.

Currently I have a 'rule' to write everything in CoffeeScript, as such many
previously .json files I now define in CSON and then compile. This is also done
for json schemas. However, as with any compiled language, most end-points don't
know these programming languages (like most browsers won't know how to deal with
Jade, it needs to be transformed to HTML first, either server or client side
rendered/compiled/transformed).
