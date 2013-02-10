require 'moonscript'
require 'busted'

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
