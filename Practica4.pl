%Hechos

usuario(23586985,'Perez','Maria',[161,164]).
usuario(12589256,'Gomez','Jose',[162,163]).
usuario(25689452,'Garcia','Delfina',[165]).

factura('00010-33550',161,anterior(fecha(20,7,2018),32993),actual(fecha(20,8,2018),33158),1).
factura('00010-33551',162,anterior(fecha(20,7,2018),27645),actual(fecha(20,8,2018),27895),2).
factura('00010-33552',163,anterior(fecha(23,7,2018),31895),actual(fecha(23,8,2018),32015),1).
factura('00010-33553',164,anterior(fecha(27,7,2018),15689),actual(fecha(27,8,2018),16000),1).
factura('00010-33554',165,anterior(fecha(27,7,2018),42589),actual(fecha(27,8,2018),42789),2).

escalafon(1,2.72).
escalafon(2,3.54).

%Reglas

regla1(F,IN) :- factura(F,_,anterior(_,Anterior),actual(_,Actual),E), escalafon(E,PU), 
                CF = 47.84, CA is Actual - Anterior,
                IN is (CA * PU) + CF.

consumo(C) :- factura(_,_,anterior(_,Anterior),actual(_,Actual),_), C is (Actual - Anterior).
consumoTotal(CT) :- findall(C, consumo(C), L), sumlist(L, CT).
cantidadConsumidores(Consu) :- findall(DNI, usuario(DNI,_,_,_),L), length(L, Consu).


regla2(Prom) :- consumoTotal(CT), cantidadConsumidores(Consu), Consu > 0, Prom is CT / Consu. 

regla3(DNI,X,Medidor,Importe) :- usuario(DNI,_,_,List), 
                                 factura(N,Medidor,_,_,_),
                                 member(Medidor,List),
                                 regla1(N,Importe), Importe > X.
                 