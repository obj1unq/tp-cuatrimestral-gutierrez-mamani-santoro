object cotaMalla{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=1
}
object bendicion{
	method estadisticaHechizeria(capo)=1
	method estadisticaLucha(capo)=0
}
object hechizo{
	method estadisticaHechizeria(capo)=if(capo.valorBaseHechizeria()>3) 2 else 0
	method estadisticaLucha(capo)=0
}
//Agregado sobre la correcion
object noRefuerzo{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=0
}