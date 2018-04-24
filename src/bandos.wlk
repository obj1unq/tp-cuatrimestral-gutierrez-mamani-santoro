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
object cofrecitoDeOro{
	method efecto(capo){
		capo.bando().incrementarTesoro(100)
	   }
	}
object cumuloDeCarbon{
	method efecto(capo) {
	 capo.bando().incrementarReserva(50)  
	 }
}
object viejoSabio{
	    method efecto(capo){
        capo.incrementarValorBaseHechizeria()
	    capo.incrementarValorBaseLucha()
       }
}