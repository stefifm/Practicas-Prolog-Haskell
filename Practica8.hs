funcion1 x 
    | x >= 0 && x <= 50 = "Nivel Bajo"
    | x >= 51 && x <= 300 = "Nivel Aceptable"
    | x >= 301 && x < 701 = "Nivel Medio"
    | otherwise = "Nivel Alto"

contar [] = 0
contar (x:xs) = 1 + contar xs

listaAuxiliar [] = []
listaAuxiliar (x:xs)
    | funcion1 x == "Nivel Aceptable" = x : listaAuxiliar xs
    | otherwise = listaAuxiliar xs

funcion2 xs = contar(listaAuxiliar xs)

funcion3 xs p = [x| x<-xs, x > p]

funcion4 [] _ = []
funcion4(x:xs) p 
    | x > p = x : funcion4 xs p
    | otherwise = funcion4 xs p 

funcion5 xs = [(x, funcion1 x) | x <- xs, x > 50]