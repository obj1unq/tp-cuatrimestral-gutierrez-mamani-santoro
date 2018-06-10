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
	 method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
	method imagen()="oro.png"
}
class CumuloDeCarbon{
	method efecto(capo) {
	 capo.bando().incrementarReserva(50)  
	 }
	 method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
	method imagen()="carbon.png"
}
class Neblina{
 var elementosOcultos = []
  method efecto(capo){
  	  elementosOcultos.forEach({elemento=>capo.encontrarElemento(elemento)})
  }
  method imagen() = "neblina.png"
  method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
class ViejoSabio{
	var puntosLucha = 1
	    method efecto(capo){
        capo.incrementarValorBaseHechizeria(ayudanteSabio.ayuda())
        
	    capo.incrementarValorBaseLucha(puntosLucha)
       }
       method imagen()="viejoSabio.png"
       
       // TODO Ahora que sabemos herencia podemos evitar esta duplicación.
       method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
object ayudanteSabio{
	var property ayuda = 1
}