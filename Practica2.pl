%Practica Parcial 2

pedido(1,111,30000000,domicilio('Salta',250,1),['television por cable','wifi']).
pedido(2,111,20000000,domicilio('Av Colon',101,2),['wifi']).
pedido(3,222,15000000,domicilio('San Martin',1321,1),['internet por cable']).
pedido(4,333,12000000,domicilio('Avellaneda',3213,2),['internet por cable','wifi']).
pedido(5,333,25000000,domicilio('9 de Julio',2123,1),['television por cable']).
pedido(6,111,20000000,domicilio('Urquiza',1203,3),['television por satelital']).


tecnico(111,'Olazabal','Juliana').
tecnico(222,'Luchetti','Gertrudis').
tecnico(333,'Manfredi','Luiggi').

descuento(1,'Centro',0.10).
descuento(2,'Alberdi',0.20).
descuento(3,'Cofico',0.15).
descuento(4,'Maipu',0.20).

%Reglas
regla1(L) :- findall(B,pedido(_,_,_,domicilio(B,_,_),_),Lis), sort(Lis,L).
regla2(DNI) :- pedido(_,_,DNI,_,Lis), length(Lis, X), X > 0.
regla3(Ped,Ape,Nom,T) :- pedido(Ped,Leg,_,domicilio(_,_,Cod),Lis), 
                         tecnico(Leg,Ape,Nom), 
                         length(Lis, C),
                         descuento(Cod,_,Por),
                         Monto is 500 * C,
                         T is Monto - (Monto * Por).
