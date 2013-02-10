#!/usr/bin/env moon

math.randomseed os.time!


require 'moonscript'
idgen = require 'cpf'


HELP = "Help!"


if (not arg[1]) or (arg[1] == '-h') or (arg[1] == '--help')
    print HELP

elseif arg[1] == '-g' or arg[1] == '--gen'
    id = idgen.random!

    print string.format '%s.%s.%s-%s',
        table.concat([d for d in *id[1, 3]]),
        table.concat([d for d in *id[4, 6]]),
        table.concat([d for d in *id[7, 9]]),
        table.concat([d for d in *id[10, 11]])

elseif arg[1] == '-c' or arg[1] == '--validate' or arg[1] == '--check'
    print idgen.validate arg[2]

