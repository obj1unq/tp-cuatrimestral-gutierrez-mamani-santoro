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
class Elemento {
	method efecto(capo)
	method llego(alguien){
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
//Elementos
class CofrecitoDeOro inherits Elemento{
	var valor = 100
	override method efecto(capo){
		capo.bando().incrementarTesoro(valor)
	 }
	method imagen()="oro.png"
}
class CumuloDeCarbon inherits Elemento{
	override method efecto(capo) {
	 capo.bando().incrementarReserva(50)  
	 }
	method imagen()="carbon.png"
}
class Neblina inherits Elemento{
 var elementosOcultos = []
  override method efecto(capo){
  	  elementosOcultos.forEach({elemento=>capo.encontrarElemento(elemento)})
  }
  method imagen() = "neblina.png"
}
class ViejoSabio inherits Elemento {
	var puntosLucha = 1
	   override method efecto(capo){
        capo.incrementarValorBaseHechiceria(ayudanteSabio.ayuda())
        
	    capo.incrementarValorBaseLucha(puntosLucha)
       }
       method imagen()="viejoSabio.png"
}
object ayudanteSabio{
	var property ayuda = 1
}