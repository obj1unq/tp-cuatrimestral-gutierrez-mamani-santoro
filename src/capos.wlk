//OBJECT ROLANDO
object rolando{
	var baseHechizeria=1
	var baseLucha=3
    var artefactos=#{}
	method valorBaseHechizeria()=baseHechizeria
	method valorBaseLucha()=baseLucha
	method artefactosObtenidos()=artefactos
	method incrementarValorBaseHechizeria(){
		baseHechizeria+=1
	}
	method incrementarValorBaseLucha(){
		baseLucha+=1
	}
	method obtenerArtefacto(_artefacto){
		artefactos.add(_artefacto)
    }
    //prueba
    method mejorArtefacto()=
       self.artefactosObtenidos().max
        ({artefacto=>artefacto.estadisticaHechizeria(self)+ artefacto.estadisticaLucha(self)})
	method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
}
//Artefactos
object espadaDestino{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=3
}
object libroHechizos{
	method estadisticaHechizeria(capo)=capo.valorBaseHechizeria()
	method estadisticaLucha(capo)=0
}
object collarDivino{
	method estadisticaHechizeria(capo)=1
	method estadisticaLucha(capo)=1
}
object armadura{
	var property refuerzo=cotaMalla
	method estadisticaHechizeria(capo)=0+ if(refuerzo==null) 0 else refuerzo.estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=2+ if(refuerzo==null) 0 else refuerzo.estadisticaLucha(capo)
}
object espejoDivino{
	method estadisticaHechizeria(capo)=capo.mejorArtefacto().estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=capo.mejorArtefacto().estadisticaLucha(capo)
	
}
//Refuerzos armadura
object cotaMalla{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=1
}
object bendicion{
	method refuerzoHechizeria(capo)=1
	method refuerzoLucha(capo)=0
}
object hechizo{
	method refuerzoHechizeria(capo)=if(capo.valorBaseHechizeria()>3) 2
	method refuerzoLucha(capo)=0
}




