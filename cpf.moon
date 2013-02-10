_calc_dv = (digits) ->
    weight = #digits + 1
    dv = 0
    for d in *digits
        dv += weight * d
        weight -= 1
    dv %= 11
    return dv < 2 and 0 or (11 - dv)


return {
    :_calc_dv
}
