
importeAlquilerCasa(cub,descub,loc,temp)
    | temp == 1 = if loc == 1 then alq-alq*0.10 else alq+alq*0.20
    | temp == 2 = alq 
    | otherwise = -1.0
    where alq = (20.0*cub) + (10.0*descub)

importeAlquilerDepto(cub,expen,loc,temp) = case temp of
                                                        1-> if loc == 1 then alq-alq*0.10 else alq+alq*0.20
                                                        2-> alq
                                                        where alq = (20.0 * cub) + expen


contar [] = 0
contar (x:xs) = 1 + contar xs

sumar [] = 0
sumar(x:xs) = x + sumar xs

importePromedioAlquiler xs = if contar xs > 0 then sumar xs / contar xs else 0