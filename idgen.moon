#!/usr/bin/env moon

math.randomseed os.time!


require 'moonscript'
cli = require 'cliargs'


cli\set_name 'idgen.moon'
cli\add_argument 'IDTYPE', "{cpf, cnpj}"
cli\add_argument 'ACTION', "{validate, gen}"
cli\optarg 'ID', "id to be validated", '', 1
cli\add_flag '-d, --digits', "Will not print separators such as '.', '-' etc."

args = cli\parse_args!
if args
    idgen = require args['IDTYPE']
    switch args['ACTION']
        when 'validate'
            io.write tostring idgen.validate args['ID']
            io.write '\n'

        when 'gen'
            id = idgen.random!
            local out
            if args['digits']
                out = tostring table.concat id
            else
                out = idgen.format id
            io.write out .. '\n'

        else
            cli\print_help!

