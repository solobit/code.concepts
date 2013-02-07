#!/usr/bin/env coffee
# vim: ft=coffee

# Algorithm

# First we create lists of repositories on github
# We hand select them by name and fetch the user/repo/description data
# Second we feed that continiously or at times to our AI
# The third step is the AI helps us select what we like.
# a Read a file in cson/coffee notation
# b Analyze and get module.dependencies
# c Get repository
# c1 if Readme bundle readme

Command = require 'commander'

srv = require 'http'
log = (args...) -> console.log args...


# Standard 'fixed' methods for getting reliable data without any authorization
# framework and login hassle. All we need is a parameter value for the source.
pkgAnonGetFromApi = (source...) ->

  switch source[1]
    when "npm" then download
    srv.get 'http://registry.npmjs.org/' + 'docpad', (callback) ->
  log callback


class Bender extends Command

  constructor : (@instanceId = new Date().getTime()) ->



class FenderBender extends Bender

