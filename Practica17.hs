-- [1460, 1727, 2644, 3164, 1520, 2086, 2759, 2883, 4221, 3198, 2912, 1085, 2846, 2560, 2247, 2635, 1477, 2763, 2872, 1600, 3400, 2162, 2818,3439, 1486, 2721, 3914, 3667, 2429, 3481].

funcion1 (x,y) = mod x y == 0

funcion2 [] _ = []
funcion2 (x:xs) ref
    | funcion1(x,ref) = x : funcion2 xs ref
    | otherwise = funcion2 xs ref



funcion3(x:xs) v
    | funcion1(x,v) =  x + x^3 
    | otherwise = x + x