%Hechos 
localidad(1,'Córdoba').
localidad(2,'Carlos Paz').
localidad(3,'Mar Chiquita').

inmueble(111,domicilio('Paraná',100,1),20,departamento(0,200)).
inmueble(222,domicilio('Maipú',200,1),30,casa(30)).
inmueble(333,domicilio('Salta',200,2),30,departamento(2,150)).
inmueble(444,domicilio('Paraná',100,1),25,departamento(1,250)).
inmueble(555,domicilio('Perú',200,2),35,casa(25)).

listaAlquilados([111,222,444]).

%Reglas

regla1(CodInm,ImpTotal) :- (inmueble(CodInm,_,Cubierta,departamento(_,MExpen)),    
                            ImpTotal is (20.0*Cubierta) + MExpen)
                            ;
                            (inmueble(CodInm,_,Cubierta,casa(Descubierta)),

                            ImpTotal is (20.0*Cubierta) + (10*Descubierta)
                                ).
regla2(CodInm,ImpAlta) :- (inmueble(CodInm,domicilio(_,_,CodLoc),_,_), regla1(CodInm,Imp),
                            CodLoc = 1, ImpAlta is Imp - (Imp*10/100)
                          )
                          ;
                          (inmueble(CodInm,domicilio(_,_,CodLoc),_,_), regla1(CodInm,Imp),
                           CodLoc > 1, ImpAlta is Imp + (Imp*20/100)

                          ).

regla3(Valor) :- inmueble(CodInm,_,Cubierta,casa(_)), listaAlquilados(Lis), not(member(CodInm,Lis)), Cubierta =< Valor.

regla4(L) :- findall(ImpAlta, (inmueble(CodInm,_,_,_),listaAlquilados(Lis), member(CodInm,Lis), regla2(CodInm,ImpAlta)),NL), sort(NL, L).

