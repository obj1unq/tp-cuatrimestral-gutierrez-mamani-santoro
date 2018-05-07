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
	method valorBaseHechizeria()=baseHechizeria
	method valorBaseLucha()=baseLucha
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
    method valorHechizeria()=baseHechizeria+artefactos.sum({artefacto=>artefacto.estadisticaHechizeria(self)})
	method valorLucha()=baseLucha+artefactos.sum({artefacto=>artefacto.estadisticaLucha(self)})
	method valorFinal()=self.valorHechizeria()+self.valorLucha()  	
	method bando()= bando
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
	 method llego(alguien) {
		self.efecto(alguien)
	}
}