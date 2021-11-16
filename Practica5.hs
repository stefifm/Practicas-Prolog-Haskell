funcion1 x
    | x == 'a' = '1'
    | x == 'e' = '2'
    | x == 'i' = '3'
    | x == 'o' = '4'
    | x == 'u' = '5'
    | otherwise = '0'

funcion2 x
    | x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' = True
    | otherwise = False

funcion3 [] = []
funcion3 (x:xs)
    | funcion2 x == False = x : funcion3 xs
    | otherwise = funcion1 x : funcion3 xs