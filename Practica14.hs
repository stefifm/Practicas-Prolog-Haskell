costoAccion(peso,base)
    | peso == 1 = base + (base * 0.15)
    | peso == 2 = base + (base * 0.20)
    | peso == 3 = base + (base * 0.25)
    | peso == 4 = base + (base * 0.30)
    | peso == 5 = base + (base * 0.35)
    |otherwise = -1.0


precioEliminarRiesgo(peso,base) = base + costoAccion(peso,base)


precioTotal [] _ = 0
precioTotal (x:xs) p
    | x > p = x + precioTotal xs p
    | otherwise = precioTotal xs p