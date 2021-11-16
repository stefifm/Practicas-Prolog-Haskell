%Hechos

promocion('AAA','Cargando 10 litros o mas de cualquier combustible, descuento del 8%',10,8).
promocion('BBB','Cargando 8 litros o mas de cualquier combustible, descuento del 5%',8,5).
promocion('CCC','Cargando 12 litros o mas de cualquier combustible, descuento del 10%',12,10).

venta('V1','AAA',fecha(29,9,2019),'1',12.5).
venta('V2','BBB',fecha(16,10,2019),'2',10.0).
venta('V3','AAA',fecha(16,10,2019),'4',15.5).
venta('V4','AAA',fecha(18,10,2019),'8',8.0).
venta('V5','CCC',fecha(18,10,2019),'9',12.0).

importe('A','Super',45.67,['1','2','3']).
importe('B','Premium',52.97,['4','5']).
importe('C','Diesel',44.69,['6']).
importe('D','Diesel Premium',50.84,['7']).
importe('E','GNC',20.99,['8','9','0']).

%reglas

regla1(CV,Slogan,Mes,Anio) :- venta(CV,CP,fecha(_,Mes,Anio),_,N), N >= 12, promocion(CP,Slogan,_,_).
regla2(CV,Porc) :- venta(CV,CP,_,_,L), promocion(CP,_,N,Desc), ((L >= N, Porc is Desc) ; (L < N, Porc is 0)).
regla3(Com,L) :- findall(CV, ( venta(CV,_,_,S,_), importe(_,Com,_,Lis), member(S,Lis)),NL), sort(NL, L).
