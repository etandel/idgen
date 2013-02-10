math.randomseed os.time!


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


return {
    :_calc_dv
    :random
}
