%Hechos

servicio(1,1,7,fecha(12,9,2015),300).
servicio(2,2,5,fecha(14,9,2015),150).
servicio(3,2,6,fecha(17,9,2015),350).
servicio(4,1,5,fecha(21,9,2015),400).
servicio(5,2,2,fecha(21,9,2015),250).
servicio(6,2,2,fecha(22,9,2015),300).

tipo(1,'Consultoria').
tipo(2,'Capacitacion').


%Reglas

regla1(VI,L) :- findall(Cod, (servicio(Cod,_,_,_,IM), IM > VI), NL), sort(NL, L).
regla2(CD,CS) :- findall(D, (servicio(_,_,N,fecha(D,_,_),_), D =<15, N > CD), NL), length(NL, CS).

consuldias(Dias) :- findall(CD, (servicio(_,1,CD,_,_), tipo(1,'Consultoria')),NL), sum_list(NL, Dias).
consulimporte(Imp) :- findall(Impdia, (servicio(_,1,_,_,Impdia), tipo(1,'Consultoria')), NL), sum_list(NL, Imp).

capacitaciondias(DiaCap) :- findall(CD, (servicio(_,2,CD,_,_), tipo(2,'Capacitacion')),NL), sum_list(NL, DiaCap).
capacitacionimporte(ImpCap) :- findall(Impdia, (servicio(_,2,_,_,Impdia), tipo(2,'Capacitacion')), NL), sum_list(NL, ImpCap).


regla3(Servicio,ImpTotal) :- tipo(_,Servicio),consuldias(Dias), consulimporte(Imp), capacitaciondias(DiaCap), capacitacionimporte(ImpCap), 
                             ((Servicio = 'Consultoria', ImpTotal is ( Imp*Dias )-200) ; (Servicio = 'Capacitacion', ImpTotal is (ImpCap*DiaCap)-150)). 

