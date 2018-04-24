class Bando{
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
class CofrecitoDeOro{
	var valor = 100
	method efecto(capo){
		capo.bando().incrementarTesoro(valor)
	   }
	}
class CumuloDeCarbon{
	method efecto(capo) {
	 capo.bando().incrementarReserva(50)  
	 }
}
object neblina{
 var elementosOcultos = []
  method efecto(capo){
  	  elementosOcultos.forEach({elemento=>capo.encontrarElemento(elemento)})
  }
}
class ViejoSabio{
	var puntosLucha = 1
	    method efecto(capo){
        capo.incrementarValorBaseHechizeria(ayudanteSabio.ayuda())
        
	    capo.incrementarValorBaseLucha(puntosLucha)
       }
}

object ayudanteSabio{
	var property ayuda = 1
}