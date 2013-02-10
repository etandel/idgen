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


return {
    :_calc_dv
}
