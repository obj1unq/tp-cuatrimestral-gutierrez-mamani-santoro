import refuerzosArmadura.*
import artefactos.*
import bandos.*
//CORRECCION: Nota MB. Se marean un poco con el espejo, se puede mejorar esa parte del código.
class Capos{
	var baseHechizeria=0
	var baseLucha=0
    var artefactos=#{}
    var bando=null
    var vivo=true
    var property imagen=null
    var property posicion=null
    
    // TODO Acá hay un cambio de nombre innecesario, por qué uno se llama "valorBase" y otro sólo "base"
    // Sería mejor que se llamen igual.
	method valorBaseHechizeria()=baseHechizeria
	method valorBaseLucha()=baseLucha
	
	// TODO Otro rename innecesario, agrega nombres distintos para llamar a lo mismo.
	
	method artefactosObtenidos()=artefactos
	method incrementarValorBaseHechizeria(num){
		baseHechizeria+=num
	}
	method incrementarValorBaseLucha(num){
		baseLucha+=num
	}
	method obtenerArtefacto(_artefacto){
		artefactos.add(_artefacto)
    } 
    
    // TODO Acá hay un problema similar, innecesaria introducción de la palabra "estadística".
    // TODO Y de paso, hechicería se escribe con C.
    method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
	
	method valorFinal()=self.valorHechizeria()+self.valorLucha()  	
	method bando()= bando
	
	// TODO ¿No es más claro si se llama vivo o estáVivo? "estadoMio" podría ser cualquier cosa.
	method estadoMio()=vivo
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
			game.removeVisual(self)
			game.say(capo,"Que debil")
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
	 method llego(alguien) {
		self.efecto(alguien)
	}
}