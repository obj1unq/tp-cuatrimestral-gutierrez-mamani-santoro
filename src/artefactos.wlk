import refuerzosArmadura.*
import bandos.*
import capos.*
object espadaDestino{
	var posicion=game.at(1.randomUpTo(5),1.randomUpTo(10))
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=3
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
	method imagen()="espadaDestino.png"
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
object libroHechizos{
	var posicion=game.at(1.randomUpTo(5),1.randomUpTo(10))
	method estadisticaHechizeria(capo)=capo.valorBaseHechizeria()
	method estadisticaLucha(capo)=0
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
	method imagen()="libroHechizos.png"
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
object collarDivino{
	var posicion=game.at(1.randomUpTo(5),1.randomUpTo(10))
	method estadisticaHechizeria(capo)=1
	method estadisticaLucha(capo)=1
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
	method imagen()="collarDivino.png"
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
class Armadura{
	var posicion=null
	var property refuerzo=cotaMalla
	method estadisticaHechizeria(capo)=refuerzo.estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=2+ refuerzo.estadisticaLucha(capo)
	
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
	method imagen()="armadura.png"
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
object espejoDivino{
	var posicion=game.at(1.randomUpTo(5),1.randomUpTo(10))
	method mejorArtefacto(capo)= 
    //CORRECCION: Si se hace la pregunta correcta antes de llamar al mejor artefacto, el if se vuelve innecesario
       capo.artefactosObtenidos().filter({artefacto=>artefacto!=self}).max
        ({artefacto=>artefacto.estadisticaHechizeria(capo)+ artefacto.estadisticaLucha(capo)})
                   
	method estadisticaHechizeria(capo)=
	//CORRECCION: Están usando self como un flag para decir "no hay mejor artefacto". 
	//CORRECCION: más prolijo es preguntar exactmente eso: "si tiene artefactos (sin incluir self) entonces.."
	   if(not capo.artefactosObtenidos().filter({artefacto=>artefacto!=self}).isEmpty())
	      self.mejorArtefacto(capo).estadisticaHechizeria(capo) else 0
	   
	method estadisticaLucha(capo)=
	  if(not capo.artefactosObtenidos().filter({artefacto=>artefacto!=self}).isEmpty())
	      self.mejorArtefacto(capo).estadisticaLucha(capo) else 0
	
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}  
	method imagen()="espejoDivino.png" 
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}