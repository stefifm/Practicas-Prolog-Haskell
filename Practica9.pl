%Hechos

reserva(1,1,7,contado(500),['custodia de valores'],300).
reserva(2,3,5,credito(6),['alquiler de bicicletas','niniera'],250).
reserva(3,2,6,contado(300),['custodia de valores','alquiler de bicicletas','guia de turismo'],350).

interes(3,10).
interes(6,15).
interes(12,25).

temporada(1,'Alta').
temporada(2,'Media').
temporada(3,'Baja').

%reglas

regla1(L) :- findall(CodReserva, (reserva(CodReserva,Temporada,_,contado(_),_,_),(Temporada=:=2 ; Temporada=:=3)), L).
regla2(CodR,CantSer) :- findall(Ser, (reserva(CodR,_,_,_,Lis,_), member(Ser,Lis)), NL), length(NL, CantSer).

regla3(Reserva,ImpTotal) :- (reserva(Reserva,_,Dias,contado(Adelanto),_,Precio), 
                              ImpTotal is (Precio * Dias) - Adelanto)
                            ;
                            ((reserva(Reserva,_,Dias,credito(Cuota),_,Precio),
                             interes(Cuota,Porc), 
                             ImpTotal is (Precio * Dias) + ( (Precio * Dias * Porc)/100 ))). 


