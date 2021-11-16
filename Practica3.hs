
funcion1 x
    | x == 'A' = '9'
    | x == 'E' = '8'
    | x == 'I' = '7'
    | x == 'O' = '6'
    | x == 'U' = '5'
    |otherwise = '0'

---Esto NO VA!!!!
{-funcion2 s
    | s == 'A' || s == 'E' || s == 'I' || s == 'O' || s == 'U' = True 
    | otherwise = False-}
--EL VERDADERO
funcion2 s = s == 'A' || s == 'E' || s == 'I' || s == 'O' || s == 'U'



-- Ejercio 3

funcion3 [] = []
funcion3 (x:xs) 
    | funcion2 x == False = x : funcion3 xs
    | otherwise = funcion1 x : funcion3 xs

--Otra opcion
funcion3Bis [] = []
funcion3Bis (x:xs) = if funcion2 x then funcion1 x : funcion3Bis xs else x : funcion3 xs