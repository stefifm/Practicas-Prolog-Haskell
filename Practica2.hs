funcion1 c m
    | c == 1 = m - (m * 0.03)
    | c == 2 = m - (m * 0.05)
    | c == 3 = m - (m * 0.07)
    | otherwise = 0

funcion2 xs n m = [x| x<-xs, x > n, x < m]

contar[] = 0.0
contar(x:xs) = 1.0 + contar xs

bonus [] _ = []
bonus (x:xs) p
    | even(x) && x > p = x : bonus xs p
    | otherwise = bonus xs p

funcion3 xs p = (contar(bonus xs p) / contar(xs)) * 100