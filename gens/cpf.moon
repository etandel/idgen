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
        cpf = [tonumber(d) for d in cpf\gmatch'%d']
    ok = #cpf == 11
    ok = ok and cpf[#cpf - 1] == _calc_dv [d for d in *cpf[1,9]]
    ok = ok and cpf[#cpf] == _calc_dv [d for d in *cpf[1,10]]
    return ok


format = (cpf) ->
    return if validate cpf
        string.format '%s.%s.%s-%s',
            table.concat [d for d in *cpf[1, 3]],
            table.concat [d for d in *cpf[4, 6]],
            table.concat [d for d in *cpf[7, 9]],
            table.concat [d for d in *cpf[10, 11]]
    else
        ''


return {
    :_calc_dv
    :random
    :validate
    :format
}
