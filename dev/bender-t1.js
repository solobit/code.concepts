
/**
 * Module dependencies.
 */

var program = require("commander");
var carrier = require("carrier");
var fs = require("fs");

program
  .version("0.0.1")
  .option("-p, --peppers", "Add peppers")
  .option("-P, --pineapple", "Add pineapple")
  .option("-b, --bbq", "Add bbq sauce")
  .option("-c, --cheese <type>", "Add the specified type of cheese [marble]")
  .option("-C, --no-cheese", "You do not want any cheese")
  .parse(process.argv);

console.log("you ordered a pizza with:");
if (program.peppers) console.log("  - peppers");
if (program.pineapple) console.log("  - pineapple");
if (program.bbq) console.log("  - bbq");



console.log("  - %s cheese", cheese);
console.log(program.args);

carrier.carry(
  fs.createReadStream("../var/data/art/ascii-bender-header.txt"),
  function(line) {
    console.log(line);
  },
  "utf-8");


program.prompt("Username: ", function(name){
  console.log("hi %s\n", name);

  program.prompt("Description:", function(desc){
    console.log("description was %s", desc.trim());

    program.prompt("Age: ", Number, function(age){
      console.log("age: %j\n", age);

      program.prompt("Birthdate: ", Date, function(date){
        console.log("date: %s\n", date);
        process.stdin.destroy();
      });
    });
  });
});


