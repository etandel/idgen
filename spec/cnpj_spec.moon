require 'busted'
require 'moonscript'

cnpj = require 'gens.cnpj'


describe 'DV', ->

    it 'should properly calc first DV', ->
        digits = [d for d in '91.517.341/0001'\gmatch '%d']
        assert.are.equal 9, cnpj._calc_dv digits

        digits = [d for d in '71.598.326/0001'\gmatch '%d']
        assert.are.equal 0, cnpj._calc_dv digits

    it 'should properly calc second DV', ->
        digits = [d for d in '84.932.174/0001-8'\gmatch '%d']
        assert.are.equal 2, cnpj._calc_dv digits

        digits = [d for d in '27.495.595/0001-5'\gmatch '%d']
        assert.are.equal 0, cnpj._calc_dv digits


describe 'Random CNPJ', ->

    it 'should generate a 14 digit sequence', ->
        mycnpj = cnpj.random!
        assert.are.equal 14, #mycnpj
        for d in *mycnpj
            assert.are.equal 1, #tostring(d)

    it 'should generate correct DVs', ->
        mycnpj = cnpj.random!

        first9 = [i for i in *mycnpj[1, 12]]
        assert.are.equal cnpj._calc_dv(first9), mycnpj[#mycnpj - 1]

        first10 = [i for i in *mycnpj[1, 13]]
        assert.are.equal cnpj._calc_dv(first10), mycnpj[#mycnpj]


describe 'Validate CNPJ', ->

    it 'should return true with correct cnpj', ->
        assert.is_true cnpj.validate '98.925.478/0001-27'
        assert.is_true cnpj.validate '85.732.812/0001-84'
        assert.is_true cnpj.validate '26.547.540/0001-83'

    it 'should return false with bad cnpj', ->
        assert.is_false cnpj.validate '98.925.478/0001-37'
        assert.is_false cnpj.validate '85.732.812/0001-81'
        assert.is_false cnpj.validate '26.547.540/0001-85'

    it 'should return false with wrongly sized cnpj', ->
        assert.is_false cnpj.validate '98.925/0001-37'
        assert.is_false cnpj.validate '85.2.812/000181'
        assert.is_false cnpj.validate ''


describe 'Format CNPJ', ->

    it 'should properly format good CNPJ', ->
        mycnpj = '98.925.478/0001-27'
        cnpjdigits = [tonumber(d) for d in mycnpj\gmatch '%d']
        assert.are.equal mycnpj, cnpj.format cnpjdigits

        mycnpj = '85.732.812/0001-84'
        cnpjdigits = [tonumber(d) for d in mycnpj\gmatch '%d']
        assert.are.equal mycnpj, cnpj.format cnpjdigits

    it 'should return empty when cnpj is bad', ->
        mycnpj = '98.925.478/0001-97'
        cnpjdigits = [tonumber(d) for d in mycnpj\gmatch '%d']
        assert.are.equal '', cnpj.format cnpjdigits

        mycnpj = '833.962.4/8'
        cnpjdigits = [tonumber(d) for d in mycnpj\gmatch '%d']
        assert.are.equal '', cnpj.format cnpjdigits

