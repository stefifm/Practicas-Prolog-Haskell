porcDescuento x y
    | x == 1 && y <= 3 = 10
    | x == 1 && y > 3 = 20
    | x == 2 && y <= 3 = 12
    | x == 2 && y > 3 = 25
    | otherwise = 0

importeTotal x y z = z * y - ( z * porcDescuento x y / 100)


contar [] = 0
contar(x:xs) = 1 + contar xs

listaMayores[] _ = []
listaMayores(x:xs) r
    | x > r = x : listaMayores xs r
    | otherwise = listaMayores xs r



cant_mayores xs r = contar(listaMayores xs r)