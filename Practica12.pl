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

regla1(CodInm,ImpAlq) :- (inmueble(CodInm,_,Cub,departamento(_,Exp)),
                          ImpAlq is (20.0 * Cub) + Exp 
                          )
                          ;
                        (inmueble(CodInm,_,Cub,casa(Descub)),
                          ImpAlq is (20.0 * Cub) + (10*Descub) 
                        ).

regla2(CodInm,ImpAlqAlta) :- (inmueble(CodInm,domicilio(_,_,CodLoc),_,_), 
                               regla1(CodInm,ImpAlq), CodLoc = 1,
                               ImpAlqAlta is ImpAlq - (ImpAlq * 0.10)
                             )
                             ;
                             (inmueble(CodInm,domicilio(_,_,CodLoc),_,_),
                               regla1(CodInm,ImpAlq), CodLoc > 1,
                               ImpAlqAlta is ImpAlq + (ImpAlq * 0.20)
                             ).

regla3(VR) :- inmueble(CodInm,_,Cub,casa(_)), listaAlquilados(Lis), not(member(CodInm,Lis)), Cub =< VR.

regla4(L) :- findall(ImpAlqAlta, (inmueble(CodInm,_,_,_), listaAlquilados(Lis), member(CodInm,Lis), regla2(CodInm,ImpAlqAlta)), NL), sort(NL, L).

