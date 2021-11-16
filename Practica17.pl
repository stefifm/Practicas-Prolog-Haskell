%Hechos
%Clientes
cliente('387FF3CD','Rafael J. Burns',plan(4534,1532,4),'Córdoba','San Francisco','convallis@dictumultricies.org').
cliente('B909BA8D','Keiko U. Tyler',plan(1027, 2083,3),'Mendoza','Mendoza','et.Proin@dictumultricies.org').
cliente('235EE8C6','Luke L. Banks',plan(3926,2799,2),'Santa Fe','Santa Fe','congue@ dictumultricies.org').
cliente('6F4DB1AA','Cynthia V. Paul',plan(2726,2252,1),'Mendoza','San Rafael','libero@telluseuaugue.org').
cliente('B2C1F939','Jonas O. Reilly',plan(4001,1939,2),'Córdoba','San Francisco','a.arcu@fermentum.co.uk').


%Licitaciones
licitacion('2751046E','B909BA8D',37565.11,'Y','N').
licitacion('A92ACE7A','2C75EF90',19809.12,'Y','N').
licitacion('60EC8EDB','97FC51B8',29265.2,'Y','N').
licitacion('DC02713C','387FF3CD',28352.56,'Y','N').
licitacion('D56B419B','387FF3CD',29452.15,'Y','Y').
licitacion('7E034E7F','6F4DB1AA',36013.43,'N','N').
licitacion('820D01B4','B2C1F939',34717.94,'Y','N').

%Vehiculos
vehiculo(1,'Nissan','March',80000.0).
vehiculo(2,'Volkswagen','Nivus',75000.0).
vehiculo(3,'Renault','Stepway',85000.0).
vehiculo(4,'Volkswagen','T-Cross',90000.0).

%Reglas
regla1(Veh) :- cliente(CodC,_,plan(_,_,Veh),_,_,_), licitacion(_,CodC,_,_,'Y').

sumaAuxiliar(Suma) :- findall(Monto, (cliente(CodC,_,_,_,_,_), licitacion(_,CodC,Monto,_,'Y')), L), sumlist(L, Suma).



regla2(MontoTotal) :- (cliente(CodC,_,_,_,_,_), licitacion(_,CodC,_,'N','Y'),   
                        sumaAuxiliar(Suma),
                        MontoTotal is Suma
                        )
                      ;
                      (cliente(CodC,_,plan(_,_,CodV),_,_,_), licitacion(_,CodC,_,'Y','Y'),
                        vehiculo(CodV,_,_,ValF),   
                        sumaAuxiliar(Suma),
                        MontoTotal is Suma + (ValF * 30 /100)
                        ).

cant_ofertas(CodC,C) :- findall(CodC, (licitacion(_,CodC,_,_,_)), L), length(L, C).
 



regla3(Lista) :- findall((Nom,Prov,Ciudad) , (cliente(CodC,Nom,_,Prov,Ciudad,_), licitacion(_,CodC,_,_,'Y'), cant_ofertas(CodC,C), C = 2  ), NL), sort(NL, Lista).





