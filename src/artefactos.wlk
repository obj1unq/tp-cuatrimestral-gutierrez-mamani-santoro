import refuerzosArmadura.*
import bandos.*
import capos.*
class Artefacto {
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
	method llego(alguien) {
		self.efecto(alguien)
		game.removeVisual(self)
	}
}
object espadaDestino inherits Artefacto{
	method valorHechiceria(capo)=0
	method valorLucha(capo)=3
	method imagen()="espadaDestino.png"
}
object libroHechizos inherits Artefacto{
	method valorHechiceria(capo)=capo.baseHechiceria()
	method valorLucha(capo)=0
	method imagen()="libro.png"
}
object collarDivino inherits Artefacto{
	method valorHechiceria(capo)=1
	method valorLucha(capo)=1
	method imagen()="collar.png"
}
class Armadura inherits Artefacto{
	var property refuerzo=cotaMalla
	method valorHechiceria(capo)=refuerzo.valorHechiceria(capo)
	method valorLucha(capo)=2+ refuerzo.valorLucha(capo)
	method imagen()="armadura.png"
}
object espejoDivino inherits Artefacto{
	method mejorArtefacto(capo)=
       capo.artefactos().filter({artefacto=>artefacto!=self}).max
        ({artefacto=>artefacto.valorHechiceria(capo)+ artefacto.valorLucha(capo)})
                   
	method valorHechiceria(capo)=
	   if(not capo.artefactos().filter({artefacto=>artefacto!=self}).isEmpty())
	      self.mejorArtefacto(capo).valorHechiceria(capo) else 0
	   
	method valorLucha(capo)=
	  if(not capo.artefactos().filter({artefacto=>artefacto!=self}).isEmpty())
	      self.mejorArtefacto(capo).valorLucha(capo) else 0
	      
	method imagen()="espejoDivino.png" 
}