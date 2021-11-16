precio_habitacion(hab,temp)
    | hab == 1 && temp == 1 = 460
    | hab == 1 && temp == 2 = 280
    | hab == 2 && temp == 1 = 740
    | hab == 2 && temp == 2 = 490
    | hab == 3 && temp == 1 = 870
    | hab == 3 && temp == 2 = 600
    | otherwise = -1

importe_estadia(hab,temp,dias) = precio_habitacion(hab,temp) * dias

cantidad_reservas [] _ = 0
cantidad_reservas (x:xs) v
    | x > v = 1 + cantidad_reservas xs v
    | otherwise = cantidad_reservas xs v