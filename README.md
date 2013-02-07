node-bender
===========

My name is Bender. Please insert girder.


File System Hierarchy
---------------------

Bender's entire personality can be written to a 3.5 inch floppy disk:

```txt
.
├── bin
├── etc
│   ├── make.d
│   ├── npm.d
│   └── procfile
├── srv
├── usr
│   ├── local
│   │   ├── docs
│   │   └── lib
│   ├── share
│   │   ├── node_modules ...
│   │   └── node_modules ...
│   └── src
└── var
    ├── out
    │   └── public
    ├── sys
    │   └── stat
    └── tmp
```

> app .... (running)instances
> bin .... (symlinked)binaries
> etc .... (configuration)
> > npm.d .... (node.js packages)
> > rvm.d .... (Gemfiles)
> > make.d (Make/Cake/Rake/Jake/files)
> > procfiles (Procfiles for PaaS)
> srv (services)
> > http (web)servers
> > https (secured)data
> > ftp (uploaded)data
> > workers (thread)specific
> usr (static)program files
> > local (internal/development)files
> > > docs (manual)references
> > > lib (support)libraries
> > share (program)files
> > > .bin (auto)symlinked node.js
> > > ... (node_modules flat tree)
> > src (source)code
> var (variable)dynamic data
> > tmp temporary files
> > sys .... socket.io and periodic writes
> > out (published) raw
> home (user)profiles
> > userA ~> app-config-1
> > userB ~> app-config-2

