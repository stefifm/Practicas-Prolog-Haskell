%Ejercicio RRHH

%Hechos

aspirantes('30000000','Lara','Pointer',11111,domicilio('Suipacha',250)).
aspirantes('35000000','Tina','Jolie',22222,domicilio('San Martin',101)).
aspirantes('25000000','Paty','Perez',44444,domicilio('Rivadavia',1321)).
aspirantes('20000000','Matilde','Smith',99999,domicilio('9 de Julio',2123)).

evaluaciones(1,'30000000',fecha(12,5,2019),['A','B','C'],[10,15,20]).
evaluaciones(2,'20000000',fecha(12,5,2019),['B','C'],[12,15]).
evaluaciones(3,'30000000',fecha(19,5,2019),['D','E'],[19,18]).
evaluaciones(4,'20000000',fecha(19,5,2019),['A','D','E'],[6,15,12]).
evaluaciones(5,'30000000',fecha(1,6,2019),['F'],[15]).

items('A','Uniforme',10).
items('B','Trabajo Colaborativo',15).
items('C','Cumplimiento de Tareas',20).
items('D','Companiero',20).
items('E','Ingles',20).
items('F','Portugues',15).

%Reglas
regla1(I1,I2) :- items(_,_,P), (I1 >= P ; P >= I2).
regla2(Cod,Ape,Nom,Calle,Altura) :- evaluaciones(Cod,DNI,_,_,_), aspirantes(DNI,Nom,Ape,_,domicilio(Calle,Altura)).
regla3(M,A,L) :- findall(DNI, (evaluaciones(_,DNI,fecha(_,M,A),_,_)),NL), sort(NL,L).