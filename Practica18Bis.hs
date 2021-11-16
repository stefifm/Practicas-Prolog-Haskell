funcion1 zona
    | zona == "Este" = 42
    | zona == "Centro" = 25
    | zona == "Oeste" = 35
    | otherwise = 0


funcion2 xs zona ref = [x * funcion1 zona | x <- xs, (x * funcion1 zona) <= ref]

funcion3 [] _ = 0
funcion3(x:xs) v
    | x <= v = 1 + funcion3 xs v
    | otherwise = funcion3 xs v

