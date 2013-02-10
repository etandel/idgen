_calc_dv = (digits) ->
    weight = #digits + 1
    dv = 0
    for d in *digits
        dv += weight * d
        weight -= 1
    dv %= 11
    return dv < 2 and 0 or (11 - dv)


random = ->
    digits = for i = 1, 9
        math.random 0, 9
    digits[#digits + 1] = _calc_dv digits
    digits[#digits + 1] = _calc_dv digits
    return digits


validate = (cpf) ->
    if type(cpf) == 'string'
        cpf = cpf\gsub '[%.%-%s]+', ''
        cpf = [tonumber(d) for d in cpf\gmatch'.']
    ok = #cpf == 11
    ok = ok and cpf[#cpf - 1] == _calc_dv [d for d in *cpf[1,9]]
    ok = ok and cpf[#cpf] == _calc_dv [d for d in *cpf[1,10]]
    return ok


return {
    :_calc_dv
    :random
    :validate
}
