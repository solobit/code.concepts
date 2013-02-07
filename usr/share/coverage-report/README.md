Uses node-jscoverage to annotate a node project's source code to make the specs gather test coverage information.
Prints summary on the coverage info before the process exits.

Usage:

./node_modules/.bin/coverage-report [-h] [-l lib] [-m 100] -- calculate jasmine test coverage using node-coverage

where:
    -h  show this help text
    -l  lib folder, default: lib
    -m  min coverage to not show the untested lines"