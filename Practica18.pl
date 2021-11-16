envio(1,'15.534.124',fecha(15,8,2021),['W','X','Y'],'Este').
envio(2,'21.453.120',fecha(23,7,2021),['X','T'],'Centro').
envio(3,'14.210.150',fecha(10,8,2021),['W','X','Y','S','T'],'Centro').
envio(4,'18.450.000',fecha(11,8,2021),['X'],'Oeste').
envio(5,'15.534.010',fecha(17,7,2021),['Y','S','T'],'Este').
envio(6,'21.453.120',fecha(16,8,2021),['X','T'],'Oeste').

repartidor('15.534.124','Jose','Sanchez').
repartidor('14.210.150','Santiago','Gimenez').
repartidor('18.450.000','Lucia','Ramallo').
repartidor('21.453.120','Soledad','Ferrer').

precio_por_unidad('Este',45).
precio_por_unidad('Centro',25).
precio_por_unidad('Oeste',35).

regla1(Mes,Anio) :- envio(_,_,fecha(_,Mes,Anio),_,'Este'),!.
regla2(Ref,NumPed,Nom,Ape,Zona,ImpEnv) :- envio(NumPed,DNI,_,Lis,Zona),
                                         repartidor(DNI,Nom,Ape),
                                         precio_por_unidad(Zona,PU), 
                                         PU =< Ref,
                                         length(Lis, C),
                                         ImpEnv is PU * C.

aux(DNI,Imp) :- envio(_,DNI,_,Lis,Zona), precio_por_unidad(Zona,PU),length(Lis,C), Imp is PU*C.


regla3(DNI,L) :- findall(Imp, aux(DNI,Imp), L).
