vendedor(1,'Francesca','Luchetti').
vendedor(2,'Vera','Petro').
vendedor(3,'Lara','Tana').

venta(111,1,355.5,fecha(23,9,2013),credito(610,3)).
venta(222,2,230.45,fecha(25,9,2013),efectivo('Si')).
venta(333,3,1834.25,fecha(5,10,2013),credito(410,4)).


articulos(111,['placa de video','parlantes']).
articulos(222,['estabilizador de corriente','pen drive']).
articulos(333,['monitor LCD','parlantes']).

%REGLAS
regla1(Articulo) :- venta(CodV,_,_,_,_), articulos(CodV,Lis), member(Articulo,Lis),!.
regla2(X,L) :- findall(Leg,(vendedor(Leg,_,_),  venta(CodV,Leg,Imp,fecha(_,9,_),_),Imp =< X,articulos(CodV,Lis), length(Lis, C), C >= 2), L).


regla3(CodV) :- (venta(CodV,_,Imp,_,efectivo('Si')), Imp > 250)
                ;
                (venta(CodV,_,Imp,_,credito(_,Cuota)), Imp > 250, Cuota =< 6).