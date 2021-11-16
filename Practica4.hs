funcion1 x 
    | x >= 0 && x <= 50 = "Nivel Bajo"
    | x >= 51 && x <= 300 = "Nivel Aceptable"
    | x >= 301 && x <= 701 = "Nivel Medio"
    | otherwise = "Nivel Alto"


funcion2 [] = 0
funcion2 (x:xs)
    | funcion1 x == "Nivel Aceptable" = 1 + funcion2 xs
    | otherwise = funcion2 xs

funcion3 xs p = [x | x<-xs,x>p]