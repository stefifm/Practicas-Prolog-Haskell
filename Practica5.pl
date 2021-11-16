promocion(111,'Cargando 10 litros o mas de cualquier combustible, descuento del 8%',10,8).
promocion(222,'Cargando 8 litros o mas de cualquier combustible, descuento del 5%',8,5).
promocion(333,'Cargando 12 litros o mas de cualquier combustible, descuento del 10%',12,10).

venta(1,111,fecha(29,9,2019),'A',12.5).
venta(2,222,fecha(16,10,2019),'B',10.0).
venta(3,111,fecha(16,10,2019),'D',15.5).
venta(4,111,fecha(18,10,2019),'H',8.0).
venta(5,333,fecha(18,10,2019),'I',12.0).

importe(1,'Super',45.67,['A','B','C']).
importe(2,'Premium',52.97,['D','E']).
importe(3,'Diesel',44.69,['F']).
importe(4,'Diesel Premium',50.84,['G']).
importe(5,'GNC',20.99,['H','I','J']).

%Reglas

regla1(CV,Slogan,Mes,Anio) :- venta(CV,CP,fecha(_,Mes,Anio),_,N), N > 12 ,promocion(CP,Slogan,_,_).
regla2(CV,PorcDesc) :- venta(CV,CP,_,_,L), promocion(CP,_,N,Desc), ((L > N, PorcDesc is Desc) ; (L < N, PorcDesc is 0)).
regla3(Combus,L) :- findall(CV, (importe(_,Combus,_,Lista), venta(CV,_,_,S,_), member(S,Lista)),NL), sort(NL, L).
