
#!/usr/bin/env coffee

###
Module dependencies.
###
fs = require("fs")
util = require("util")
colors = require("colors")
program   = require("commander")
carrier   = require("carrier")
natural   = require("natural")
readline  = require("readline")
classifier = new natural.BayesClassifier()

# Empty clean new line terminal sequences
log = (args...) -> console.log args...

# We'll get many more lists like these
ListDeploymentMethods = [ 'vps server', 'static', 'shared', 'paas' ]
ListMarkupLanguages   = [ 'jade', 'haml', 'html', 'zen', 'coffeekup', 'coffeescript' ]
ListMakeBuildTools    = [ 'Makefile', 'Cakefile', 'Rakefile', 'Gemfile', 'Jakefile' ]
ListStylePreProcess   = [ 'stylus', 'stylus w/nib', 'less', 'scss', 'css' ]
ListGirderBaseItems   = [ 'query', 'template', 'boilerplate', 'grid', 'framework', 'web',
                          'collection', 'info', 'tasks', 'site', 'interpet', 'project' ]

program

  # App information
  .version("0.0.1")

  # Top-level command attributes and option flags
  .option("-b, --robot", "Interactive Read Object Build Output Terminal -loop")
  .option("-k, --keycode", "Access internal mechanisms with special codes")
  .option("-l, --list", "List Bender modules in core and online")
  .option("-c, --config <file>", "Location of the configuration file")
  .option("-w, --web", "Fire up a web instance")

  # Machine learning
  .command("train")
  .description("Learn Bender so bad stuff and he'll learn from you.")
  .action((options) ->

    # This is actually the right way to create a terminal interface
    rl = readline.createInterface process.stdin, process.stdout

    rl.setPrompt "ROBOT> "
    rl.prompt()

    # Iterate over every print line
    rl.on("line", (line) ->

      # Selection of cases
      switch line.trim()

        # Badass modus
        when "2716057"

          # 1729
          program.password "Password:", "*", (pass) ->
            if pass is 1729
              log "%s", pass
              log "I'm Bender, baby, please insert liquor!"
              rl.setPrompt "R0B4D> "
            else
              log "Please try again"

        when "web"
          program.choose listHtml, 1, (i) ->
            log "You chose %d %s", i+1, listHtml[i]

        # REPL
        else
          log "My name is Bender. Please insert girder `" + line.trim() + "`"
          rl.setPrompt "expected result? "
          expect = rl.prompt()
          classifier.addDocument line, expect
          rl.setPrompt "ROBOT> "
          classifier.train()


      rl.prompt()

    ).on "close", ->
      goodbye = [ "Bite my shiny metal ass!", "What do you mean 'we,' flesh-tube?", "That's no alien spaceship-that's my ass!" ]
      console.log goodbye[Math.floor(Math.random()*goodbye.length)]
      classifier.save 'classifier.json', (err, classifier) ->
        log err if err
        log "saved classifier file...ok"

      process.exit 0


  )
program.parse process.argv
#log program.args






