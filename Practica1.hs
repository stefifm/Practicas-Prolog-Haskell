funcion1 x
    | x >= 90 && x <= 100 = "Nivel Muy Bueno"
    | x >= 75 && x <= 89 = "Nivel Bueno"
    | x >= 60 && x <= 74 = "Nivel Aceptable"
    | x >= 45 && x <= 59 = "Nivel Regular"
    | x >= 0 && x <= 44 = "Nivel Inaceptable"
    | otherwise = "Puntaje Erroneo"

funcion2 xs n s= [x|x <-xs, x >= n, x<=s]

funcion3 [] _ = 0
funcion3 (x:xs) n = if x > n then 1 + funcion3 xs n else funcion3 xs n 
