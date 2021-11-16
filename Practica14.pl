%Base de Conocimiento
accionRecomendada('Solicitar a AFIP resumen fiscal','Seccion A',analisisRiesgo(1,5,100),3).
accionRecomendada('Fiscalizar Contrato Sociedad','Seccion B',analisisRiesgo(2,3,50),3).
accionRecomendada('Solicitar plan para BPO','Seccion C',analisisRiesgo(3,2,40),5).
accionRecomendada('Solicitar plan de calidad','Seccion A',analisisRiesgo(4,1,20),1).
accionRecomendada('Dar curso a departamento legal','Seccion C',analisisRiesgo(6,5,100),4).
accionRecomendada('Analizar organigrama','Seccion B',analisisRiesgo(5,1,20),7).
accionRecomendada('Analizar organigrama','Seccion A',analisisRiesgo(5,1,20),7).
accionRecomendada('Redactar carta documento solicitando expediente','Seccion B',analisisRiesgo(6,5,100),4).

riesgo(1,'No presento historial tributario','Alto').
riesgo(2,'No tiene conformada mesa directores','Medio').
riesgo(3,'Falta de procedimientos formalizados','Medio').
riesgo(4,'No posee norma de calidad ISO','Bajo').
riesgo(5,'Posee mandos medios débiles','Bajo').
riesgo(6,'Posee gerentes con causas judiciales','Alto').

socio(1,'Jupiter SRL',250000,120).
socio(2,'Saturno SA',100000,40).
socio(3,'Urano SA',80000,80).
socio(4,'Mercurio SRL',350000,180).
socio(5,'Venus SA',40000,20).
socio(6,'Terra',80000,30).
socio(7,'Pluton SA',70000,70).

%Reglas
regla1(NomSoc,Acciones) :- accionRecomendada(Acciones,_,analisisRiesgo(Nro,_,_),NroSoc),
                           riesgo(Nro,_,'Alto'),
                           socio(NroSoc,NomSoc,_,_).

regla2(Seccion,Riesgo,NomSoc) :- accionRecomendada(_,Seccion,analisisRiesgo(Nro,_,_),NroSoc),
                                 riesgo(Nro,Riesgo,_),
                                 socio(NroSoc,NomSoc,_,_).


regla3(Riesgo,CostoGral) :- (accionRecomendada(_,_,analisisRiesgo(Nro,Peso,CostoBase),_),
                                riesgo(Nro,Riesgo,_),
                                Peso >= 1, Peso =< 3, 
                                CostoGral is CostoBase + (CostoBase * 15 / 100)
                            )
                            ;
                            (accionRecomendada(_,_,analisisRiesgo(Nro,Peso,CostoBase),_),
                                riesgo(Nro,Riesgo,_),   
                                Peso >= 4, Peso =< 5, 
                                CostoGral is CostoBase + (CostoBase * 20 / 100)
                            ).