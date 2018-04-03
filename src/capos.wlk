object rolando{
	var baseHechizeria=1
	var baseLucha=3
    var artefactos=#{}
	method valorBaseHechizeria()=baseHechizeria
	method valorBaseLucha()=baseLucha
	method incrementarValorBaseHechizeria(){
		baseHechizeria+=1
	}
	method incrementarValorBaseLucha(){
		baseLucha+=1
	}
	method obtenerArtefacto(_artefacto){
		artefactos.add(_artefacto)
    }
	method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
}
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


//2.1 Emiliano
object armadura {
	var property refuerzo = cotaDeMalla
	
	method estadisticaHechizeria(capo) = refuerzo.estadisticaHechizeria(capo)
	method estadiscticaLucha (capo) = 2 + refuerzo.estadisticaLucha(capo)
	
}

object cotaDeMalla {
	
	method estadisticaHechizeria(capo) =  0
	method estadisticaLucha(capo) = 1
}

object bendicion {
	
	method estadisticaHechizeria(capo) =  1
	method estadisticaLucha(capo) = 0
}

object hechizo {
	method estadisticaHechizeria(capo) = if (capo.valorHechizeria() > 3 ) {2}
}




