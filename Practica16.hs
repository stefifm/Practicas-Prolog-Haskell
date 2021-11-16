precio item
    | item =='A' = 250
    | item =='B' = 190
    | item =='C' = 220
    | item =='D' = 280
    | item =='E' = 200
    | otherwise = 0


mayor [x] = precio x
mayor(x:xs)
    | precio x > mayor xs = precio x
    | otherwise = mayor xs

generar [] _ = []
generar(x:xs) ref
    | precio x < ref = precio x : generar xs ref
    | otherwise = generar xs ref
