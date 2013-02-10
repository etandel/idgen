#!/usr/bin/env moon

math.randomseed os.time!


require 'moonscript'
idgen = require 'cpf'
cli = require 'cliargs'


cli\set_name 'idgen.moon'
cli\add_argument 'ACTION', '{validate, gen}'
cli\optarg 'ID', 'id to be validated', '', 1

args = cli\parse_args!
if args
    switch args['ACTION']
        when 'validate'
            io.write tostring idgen.validate args['ID']
            io.write '\n'

        when 'gen'
            id = idgen.random!
            io.write string.format '%s.%s.%s-%s',
                table.concat [d for d in *id[1, 3]],
                table.concat [d for d in *id[4, 6]],
                table.concat [d for d in *id[7, 9]],
                table.concat [d for d in *id[10, 11]]
            io.write '\n'

        else
            cli\print_help!

