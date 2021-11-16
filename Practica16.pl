%HECHOS
pedido(1,4,'Lara',cliente((11111),domicilio('Salta',250)),carrito(['A','A','D'])).
pedido(2,2,'Tina',cliente((22222),domicilio('Av. Colonn',101)),carrito(['B','C'])).
pedido(3,3,'Lali',cliente((44444),domicilio('San Martinn',1321)),carrito(['A','D'])).
pedido(4,1,'Tina',cliente((33333),domicilio('Avellaneda',3213)),carrito(['B','D','D'])).
pedido(5,4,'Lara',cliente((99999),domicilio('9 de Julio',2123)),carrito(['A','B','B','B','E'])).
pedido(6,4,'Tina',cliente((88888),domicilio('Urquiza',1503)),carrito(['D','D'])).

estado(1,'Registrado').
estado(2,'En preparacion').
estado(3,'En camino').
estado(4,'Entregado').
estado(5,'Cancelado').

cartaDeItem('A','Combo1',250).
cartaDeItem('B','Combo2',190).
cartaDeItem('C','Combo3',220).
cartaDeItem('D','Combo4',280).
cartaDeItem('E','Combo5',200).

%Reglas

regla1(Tel) :- (pedido(_,_,_,cliente(Tel,_),carrito(Lis)), not(member('E',Lis)),!)
                ;
                (pedido(_,1,_,cliente(Tel,_),_),!).

regla2(CodP,Puntos) :- (pedido(CodP,_,_,_,carrito(Lis)), sort(Lis, NL), 
                        not(member('B',NL)),length(NL,Art),
                        Puntos is Art * 10)
                        ;
                        (pedido(CodP,_,_,_,carrito(Lis)), sort(Lis, NL), 
                        member('B',NL),length(NL,Art),
                        Puntos is Art * 10 + 15).

regla3(Rep,CantI) :- pedido(_,1,Rep,_,carrito(Lis)), length(Lis, CantI).
