%Hechos


venta(1,'Perez,Noelia',fecha(2,4,2014),1,210,libro('Programacion','Prentice Hall')).
venta(2,'Marti,Nahuel',fecha(10,5,2014),2,110,revista(2012,3)).
venta(3,'Luna,Rebeca',fecha(11,5,2014),1,200,libro('Programacion','Edit Planet')).
venta(4,'Luque,Claudio',fecha(11,5,2014),1,85,revista(2013,1)).
venta(5,'Martinez,Tomas',fecha(3,6,2014),4,190,libro('Estadistica','Trillas')).

especialidad(1,'Sistemas').
especialidad(2,'Quimica').
especialidad(3,'Industrial').
especialidad(4,'Mecanica').


%Reglas

regla1(Especialidad,Cant) :- findall(Especialidad, venta(_,_,_,Especialidad,_,_), L), length(L, Cant).

regla2(VR) :- venta(_,_,_,_,Imp,libro(_,_)), Imp > VR,!.

regla3(CodV,DescEspe) :- ( venta(CodV,_,_,NE,_,libro('Programacion',_)), especialidad(NE,DescEspe))
                          ;
                        ( venta(CodV,_,_,NE,_,revista(2012,_)), especialidad(NE,DescEspe)).