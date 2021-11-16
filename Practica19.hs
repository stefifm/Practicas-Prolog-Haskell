{-  Realizar una función que reciba 3 parámetros: una lista de cantidades de artículos 
correspondientes a diferentes pedidos asignados a un repartidor, el Dni del repartidor a quien 
se le asignaron todos los pedidos cuyas cantidades figuran en la lista, y un valor de referencia. 
La función deberá generar una nueva lista con el monto que cobrará el repartidor por cada pedido, 
de tal manera que en la lista generada sólo se incluyan aquellos montos que sean mayores o 
iguales al valor de referencia. Tener en cuenta que el monto de cada pedido se deberá calcular multiplicando la cantidad de artículos 
del pedido por la comisión del repartidor cuyo Dni es especificado como segundo parámetro -}

funcion3 [] _ _ = []
funcion3 (x:xs) dni ref
    | monto >= ref = monto : funcion3 xs dni ref
    | otherwise = funcion3 xs dni ref
    where monto = x * dni