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
    method sinEspejo(){
    	var lisSinEspejo=self.artefactosObtenidos()
    	   lisSinEspejo.remove(espejoDivino)
    		return lisSinEspejo
    }
    method mejorArtefacto(espejoDivino)=
     if(! self.artefactosObtenidos().contains(espejoDivino) or self.artefactosObtenidos().size()>=2 )
       self.artefactosObtenidos().filter({artefacto=>artefacto!=espejoDivino}).max
        ({artefacto=>artefacto.estadisticaHechizeria(self)+ artefacto.estadisticaLucha(self)})
            else espejoDivino
            
	method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
	
	//3
	method bando()= bandoDelSur
	
	method encontrarElemento(unElemento){
		unElemento.incrementarValor(self)
	}
	
	
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
	method estadisticaHechizeria(capo)=
	   if(capo.artefactosObtenidos().size()==1 and capo.artefactosObtenidos().contains(self)) 0 
	   else capo.mejorArtefacto(self).estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=
	  if(capo.artefactosObtenidos().size()==1 and capo.artefactosObtenidos().contains(self)) 0 
	   else capo.mejorArtefacto(self).estadisticaLucha(capo)
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

//Punto 3
object bandoDelSur{
	var tesoro =0
	var reservas = 0
	
	method tesoro() = tesoro
	
	method reserva() = reservas
	
	method incrementarTesoro(unaCantidad){
		tesoro +=unaCantidad
	}
	method incrementarReserva(unaCantidad){
		reservas += unaCantidad
	}

}
//ELementos
object cofrecitoDeOro{
	method incrementarValor(capo){
		capo.bando().incrementarTesoro(100)
	   }
	}


object cumuloDeCarbon{
	method incrementarValor(capo) {
	 capo.bando().incrementarReserva(50)  
	 }
}

object viejoSabio{
    method  incrementarValor(capo) {
    	capo.incrementarValorBaseHechizeria()
    	capo.incrementarValorBaseLucha()
    }
     
}
