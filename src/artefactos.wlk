import refuerzosArmadura.*
object espadaDestino{
	method estadisticaHechizeria(capo)=0
	method estadisticaLucha(capo)=3
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
}
object libroHechizos{
	method estadisticaHechizeria(capo)=capo.valorBaseHechizeria()
	method estadisticaLucha(capo)=0
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
}
object collarDivino{
	method estadisticaHechizeria(capo)=1
	method estadisticaLucha(capo)=1
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
}
object armadura{
	var property refuerzo=cotaMalla
	//CORRECCION: Una manera de evitar el if null es haciendo un objeto que represente  el "no refuerzo".Arreglado
	//CORRECCION: ese es un refuerzo como los demás que devuelve 0 cuando le preguntan los valores.Arreglado
	method estadisticaHechizeria(capo)=refuerzo.estadisticaHechizeria(capo)
	method estadisticaLucha(capo)=2+ refuerzo.estadisticaLucha(capo)
	method efecto(capo){
		capo.obtenerArtefacto(self)
	}
}
object espejoDivino{
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
}