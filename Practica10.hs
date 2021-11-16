


importeAlquilerCasa cub descu loc temp
    | temp == 1 = if loc == 1 then alq-alq*0.1 else alq+alq*0.2
    | temp == 2 = alq
    | otherwise = -1.0
    where alq = (20.0*cub) + (10.0*descu)

importeAlquilerDepto cub exp loc temp = case temp of
                                                    1 -> if loc == 1 then alq-alq*0.1 else alq+alq*0.2
                                                    2 -> alq 
                                                    where alq = (20*cub) + exp

sumar [] = 0
sumar(x:xs) = x + sumar xs 

contar [] = 0
contar(x:xs) = 1 + contar xs

importePromedioAlquiler xs = sumar xs / contar xs