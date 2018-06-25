object cotaMalla{
	method valorHechiceria(capo)=0
	method valorLucha(capo)=1
}
object bendicion{
	method valorHechiceria(capo)=1
	method valorLucha(capo)=0
}
object hechizo{
	method valorHechiceria(capo)=if(capo.baseHechiceria()>3) 2 else 0
	method valorLucha(capo)=0
}
object noRefuerzo{
	method valorHechiceria(capo)=0
	method valorLucha(capo)=0
}