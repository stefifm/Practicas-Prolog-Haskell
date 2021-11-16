funcion1 x
    | x == 'A' = '9'
    | x == 'E' = '8'
    | x == 'I' = '7'
    | x == 'O' = '6'
    | x == 'U' = '5'
    | otherwise = '0'

{-validar x 
    | x == 'A' || x == 'E' || x == 'I' || x == 'O' || x == 'U' = True
    | otherwise = False -}

validar x = x == 'A' || x == 'E' || x == 'I' || x == 'O' || x == 'U'

codificar [] = []
codificar(x:xs) = if validar x then funcion1 x : codificar xs else x : codificar xs
