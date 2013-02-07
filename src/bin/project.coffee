#!/usr/bin/env coffee

filesys = require 'fs'
dirpath = require 'path'
program = require 'commander'
makedir = require 'mkdirp'
thispkg = require '../package.json'

fshFromFolder = (path) ->

  console.log fs.lstat(path)
