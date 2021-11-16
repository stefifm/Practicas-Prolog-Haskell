

funcion1 tipo 
    | tipo == 'E' = 0
    | tipo == 'D' = 10
    | tipo == 'T' = 25
    | otherwise = -3


funcion2 lista desde hasta = [x | x <-lista, x==desde || x == hasta]


verificar tipo = tipo == 'E'|| tipo == 'D' || tipo == 'T'



funcion3 [] _ _ = 0
funcion3 (x:xs) tipo ref 
    | verificar tipo && imp == ref = imp + funcion3 xs tipo ref
    | verificar tipo == False = 0
    | otherwise = funcion3 xs tipo ref
    where imp = x + (x*funcion1 tipo / 100) 