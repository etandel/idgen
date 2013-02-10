require 'busted'
require 'moonscript'

cpf = require 'gens.cpf'


describe 'DV', ->

    it 'should properly calc first DV', ->
        digits = [d for d in '894.339.433'\gmatch '%d']
        assert.are.equal 0, cpf._calc_dv digits

        digits = [d for d in '157.828.837'\gmatch '%d']
        assert.are.equal 1, cpf._calc_dv digits

    it 'should properly calc second DV', ->
        digits = [d for d in '874.463.815-9'\gmatch '%d']
        assert.are.equal 0, cpf._calc_dv digits

        digits = [d for d in '436.567.586-9'\gmatch '%d']
        assert.are.equal 7, cpf._calc_dv digits


describe 'Random CPF', ->

    it 'should generate an 11 digit sequence', ->
        assert.are.equal 11, #cpf.random!

    it 'should generate correct DVs', ->
        mycpf = cpf.random!

        first9 = [i for i in *mycpf[1, 9]]
        assert.are.equal cpf._calc_dv(first9), mycpf[#mycpf - 1]

        first10 = [i for i in *mycpf[1, 10]]
        assert.are.equal cpf._calc_dv(first10), mycpf[#mycpf]


describe 'Validate CPF', ->

    it 'should return true with correct cpf', ->
        assert.is_true cpf.validate '436.567.586-97'
        assert.is_true cpf.validate '833.962.075-48'
        assert.is_true cpf.validate '488.512.841-21'

    it 'should return false with bad cpf', ->
        assert.is_false cpf.validate '436.567.586-17'
        assert.is_false cpf.validate '833.962.075-49'
        assert.is_false cpf.validate '488.512.841-01'

    it 'should return false with wrongly sized cpf', ->
        assert.is_false cpf.validate '436.567.6-97'
        assert.is_false cpf.validate '881281-2'
        assert.is_false cpf.validate ''


describe 'Format CPF', ->

    it 'should properly format good CPF', ->
        mycpf = '436.567.586-97'
        cpfdigits = [tonumber(d) for d in mycpf\gmatch '%d']
        assert.are.equal mycpf, cpf.format cpfdigits

        mycpf = '833.962.075-48'
        cpfdigits = [tonumber(d) for d in mycpf\gmatch '%d']
        assert.are.equal mycpf, cpf.format cpfdigits


    it 'should return empty when cpf is bad', ->
        mycpf = '436.567.586-87'
        cpfdigits = [tonumber(d) for d in mycpf\gmatch '%d']
        assert.are.equal '', cpf.format cpfdigits

        mycpf = '833.962.48'
        cpfdigits = [tonumber(d) for d in mycpf\gmatch '%d']
        assert.are.equal '', cpf.format cpfdigits

