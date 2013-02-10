require 'busted'
require 'moonscript'

cpf = require 'cpf'

describe 'DV', ->

    it 'should properly calc first DV 0', ->
        digits = [d for d in '894.339.433'\gmatch '%d']
        assert.are.equal 0, cpf._calc_dv digits

    it 'should properly calc first DV 1', ->
        digits = [d for d in '157.828.837'\gmatch '%d']
        assert.are.equal 1, cpf._calc_dv digits

    it 'should properly calc second DV 0', ->
        digits = [d for d in '874.463.815-9'\gmatch '%d']
        assert.are.equal 0, cpf._calc_dv digits

    it 'should properly calc second DV 7', ->
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

