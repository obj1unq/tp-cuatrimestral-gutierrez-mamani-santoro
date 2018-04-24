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
	
}
object viejoSabio{
	    method efecto(capo){
        capo.incrementarValorBaseHechizeria()
	    capo.incrementarValorBaseLucha()
       }
}