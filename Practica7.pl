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

%Reglas

regla1(CV,Slogan,Mes,Anio) :- venta(CV,CP,fecha(_,Mes,Anio),_,N), N >= 12,promocion(CP,Slogan,_,_).
regla2(CV,PorcDesc) :- venta(CV,CP,_,_,L), promocion(CP,_,N,D), ((L > N, PorcDesc is D); (L < N, PorcDesc is 0)).
regla3(Combustible,Lista) :- findall(CV, (importe(_,Combustible,_,L), venta(CV,_,_,S,_), member(S,L)), NL), sort(NL, Lista).


