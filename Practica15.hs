func1 tipo
    | tipo == 1 = 15
    | tipo == 2 = 20
    | tipo == 3 = 30
    | otherwise = -1

func2(imp,tipo) 
    | imp < 0 || tipo < 1 || tipo > 3 = -1
    | otherwise = imp * func1 tipo / 100

func3 [] = 0
func3(x:xs) = x + func3 xs


contar [] = 0
contar(x:xs) = 1 + contar xs


func4 xs
    | contar xs < 3 = func3 xs 
    | contar xs >= 3 && contar xs <= 5 = func3 xs - (func3 xs * 10 /100)
    | contar xs > 5 = func3 xs  - (func3 xs * 20 /100) 
