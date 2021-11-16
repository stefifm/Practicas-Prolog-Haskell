precio_venta(monto,base) = base + monto

precio_venta_final(cod,monto,base)
    | imp >= 200 = if cod == 1 then imp-imp*0.10  else imp-imp*0.08
    | otherwise = imp
    where imp = precio_venta(monto,base)



contar [] = 0
contar (x:xs) = 1 + contar xs

sumar [] = 0
sumar (x:xs) = x + sumar xs

promedio xs = sumar xs / contar xs