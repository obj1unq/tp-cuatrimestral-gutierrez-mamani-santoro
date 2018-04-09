//OBJECT ROLANDO
object rolando{
	var baseHechizeria=1
	var baseLucha=3
    var artefactos=#{}
    
	method valorBaseHechizeria()=baseHechizeria
	method valorBaseLucha()=baseLucha
	method artefactosObtenidos()=artefactos
	method incrementarValorBaseHechizeria(){
		//Aumenta el valor base hechizeria en 1
		baseHechizeria+=1
	}
	method incrementarValorBaseLucha(){
		//Aumenta el valor base lucha en 1
		baseLucha+=1
	}
	method obtenerArtefacto(_artefacto){
		//agrega un artefacto al conjunto de artefactos
		artefactos.add(_artefacto)
    }
    
    //devuelve el valor base de hechizeria mas los puntos de hechizeria aportados por los artefactos
    method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
    
    //devuelve el valor base de lucha mas los puntos de lucha aportados por los artefactos
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
    //2
    
    
    
       	
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
	method estadisticaHechizeria(capo)=if(refuerzo==null) 0 else refuerzo.estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=2+ if(refuerzo==null) 0 else refuerzo.estadisticaLucha(capo)
}
object espejoDivino{
	method mejorArtefacto(capo)= 
    //devuelve el artefacto que aporta mas puntos de lucha y hechizeria combinados
    // excluye el espejo divino de los artefactos, a menos que sea el unico artefacto
     if(! capo.artefactosObtenidos().contains(self) or capo.artefactosObtenidos().size()>=2 )
       capo.artefactosObtenidos().filter({artefacto=>artefacto!=self}).max
        ({artefacto=>artefacto.estadisticaHechizeria(capo)+ artefacto.estadisticaLucha(capo)})
            else self
	
	// devuelve las estadisticas del mejor artefacto, si solo tiene el espejo devuelve 0
	method estadisticaHechizeria(capo)=
	   if(capo.artefactosObtenidos().size()==1 and capo.artefactosObtenidos().contains(self)) 0 
	   else self.mejorArtefacto(capo).estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=
	  if(capo.artefactosObtenidos().size()==1 and capo.artefactosObtenidos().contains(self)) 0 
	   else self.mejorArtefacto(capo).estadisticaLucha(capo)
}
//Refuerzos armadura
object cotaMalla{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=1
}
object bendicion{
	method estadisticaHechizeria(capo)=1
	method estadisticaLucha(capo)=0
}
object hechizo{
	//Si el valor base de hechizeria del capo es mayor a 3 devuelve 2, en otro caso 0
	method estadisticaHechizeria(capo)=if(capo.valorBaseHechizeria()>3) 2 else 0
	method estadisticaLucha(capo)=0
}

//Bando de rolando
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
//Elementos
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
	//incrementa los valores base de lucha y hechizeria en 1
	    method incrementarValor(capo){
        capo.incrementarValorBaseHechizeria()
	    capo.incrementarValorBaseLucha()
       }
}