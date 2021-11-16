precio_habitacion (x,y)
    | x == 1 && y == 1 = 460
    | x == 1 && y == 2 = 280
    | x == 2 && y == 1 = 740
    | x == 2 && y == 2 = 490
    | x == 3 && y == 1 = 870
    | x == 3 && y == 2 = 600
    | otherwise = 0


importe_estadia tipo temp dias = precio_habitacion(tipo,temp) * dias

cantidad_reservas [] _ = 0
cantidad_reservas(x:xs) v
    | x > v = 1 + cantidad_reservas xs v
    | otherwise = cantidad_reservas xs v