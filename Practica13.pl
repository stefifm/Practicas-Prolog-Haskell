% reserva/6
% reserva(Código,CodTemporada,CantDías,TipoPago,ServiciosContradados,PrecioXDía).
reserva(1,1,7,contado(500),['custodia de valores'],300).
reserva(2,3,5,credito(6),['alquiler de bicicleta','niñera'],250).
reserva(3,2,6,contado(300),['custodia de valores','alquiler de bicicleta','guía de turismo'],350).

% temporada/2
% temporada(Código,Descripción).
temporada(1,'alta').
temporada(2,'media').
temporada(3,'baja').
%
%interés/2
%interés(CantCuotas,PorcInterés).
interes(3,10).
interes(6,15).
interes(12,25).

%Generar una lista con los códigos de reservas para temporada baja o media,
%cuya forma de pago sea contado.
%Predicado sugerido para esta regla: regla1/1.
regla1(L) :- findall(CodRes, (reserva(CodRes,CodTemp,_,contado(_),_,_), CodTemp > 1, CodTemp =< 3), L).



%Informar para un determinado código de reserva la cantidad de servicios contratados.
%Predicado sugerido para esta regla: regla2/2.
regla2(CodRes,CantS) :- reserva(CodRes,_,_,_,Lis,_), length(Lis, CantS).


%Importe total que resta por pagar de una determinada reserva.
%Si la reserva es con pago de contado, el importe a pagar es igual al precio por día,
%por la cantidad de días, menos el importe de adelanto.
% Si la reserva es con pago en crédito, el importe a pagar es igual al
% importe por día, por la cantidad de días, más el porcentaje de interés
% de acuerdo a la cantidad de cuotas correspondiente. Predicado sugerido
% regla3/2 (20 puntos)

regla3(CodRes,ImpTotal) :- ( reserva(CodRes,_,CantD,contado(Adelanto),_,PrecXDia),
                            ImpTotal is (PrecXDia * CantD) - Adelanto
                           
                           )
                           ;
                           ( reserva(CodRes,_,CantD,credito(Cuota),_,PrecXDia),
                            interes(Cuota,Inter),
                            ImpTotal is (PrecXDia * CantD) + ((PrecXDia * CantD * Inter)/100)
                           
                           ).