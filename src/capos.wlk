import refuerzosArmadura.*
import artefactos.*
import bandos.*
//CORRECCION: Nota MB. Se marean un poco con el espejo, se puede mejorar esa parte del código.
class Capos{
	var baseHechiceria=0
	var baseLucha=0
    var artefactos=#{}
    var bando=null
    var vivo=true
    var property imagen=null
    var property posicion=null
    
	method baseHechiceria()=baseHechiceria
	method baseLucha()=baseLucha

	method artefactos()=artefactos
	method incrementarValorBaseHechiceria(num){
		baseHechiceria+=num
	}
	method incrementarValorBaseLucha(num){
		baseLucha+=num
	}
	method obtenerArtefacto(_artefacto){
		artefactos.add(_artefacto)
    } 
    method valorHechiceria()=baseHechiceria+artefactos.sum({artefacto=>artefacto.valorHechiceria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.valorLucha(self)})
	
	method valorFinal()=self.valorHechiceria()+self.valorLucha()  	
	method bando()= bando
	
	method estaVivo()=vivo
	method muerte(){
		vivo=false
	}
	method encontrarElemento(unElemento){
		unElemento.efecto(self)
	}
	method peleaDeCapos(capo){
		if(self.valorFinal()>capo.valorFinal()){
			 capo.muerte()
			 game.stop()
		}else{
			self.muerte()
			game.say(capo,"Que debil")
			game.removeVisual(self)
			
		}
	}
	method efecto(capo){
      if(self.bando()==capo.bando()){
      	 artefactos.forEach({artefacto=>capo.encontrarElemento(artefacto)})
      	 artefactos.clear()
      	 game.say(capo,"Gracias")
      }else{
      	self.peleaDeCapos(capo)
      }
	}
	method move(nuevaPosicion) {
	  self.posicion(nuevaPosicion)
	}
	
	// TODO ¿Por qué esta indirección llegó => efecto? ¿Es necesario?
	//Para la interaccion entre capos en el wollok game
	 method llego(alguien) {
		self.efecto(alguien)
	}
}