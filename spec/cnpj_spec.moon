require 'busted'
require 'moonscript'

cnpj = require 'cnpj'

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

