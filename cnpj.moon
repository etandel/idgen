_calc_dv = (digits) ->
    next_weight = (->
        w = #digits - 6
        ->
            w -= 1
            if w == 1
                w = 9
            return w)!
    dv = 0
    for d in *digits
        dv += next_weight! * d
    dv %= 11
    return dv < 2 and 0 or (11 - dv)


random = ->
    digits = for i = 1, 12
        math.random 0, 12
    digits[#digits + 1] = _calc_dv digits
    digits[#digits + 1] = _calc_dv digits
    return digits


return {
    :_calc_dv
    :random
}
