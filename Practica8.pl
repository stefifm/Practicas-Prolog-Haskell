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

%reglas

regla1(NLiqui,ImpNeto) :- factura(NLiqui,_,anterior(_,Anterior),actual(_,Actual),CE), 
                          escalafon(CE,PU),
                          ConsumoActual is Actual - Anterior, CargoFijo is 47.84,
                          ImpNeto is (ConsumoActual * PU) + CargoFijo.

%Ejercicio 2

cant_usuarios(CU) :- findall(DNI, usuario(DNI,_,_,_), Lis), length(Lis, CU).
consumo(C) :-  factura(_,_,anterior(_,Anterior),actual(_,Actual),_),
               C is Actual - Anterior.
consumo_total(ConsuTotal) :- findall(C, consumo(C), Lista), sumlist(Lista, ConsuTotal).

consumo_promedio(Prom) :-  cant_usuarios(CU), consumo_total(ConsuTotal),
                            Prom is ConsuTotal / CU.

%Ejercicio 3
regla3(DNI,X,Medidor,ImpNeto) :- usuario(DNI,_,_,Lis), factura(NLiqui,Medidor,_,_,_), 
                         member(Medidor,Lis), regla1(NLiqui,ImpNeto),
                         ImpNeto > X.





