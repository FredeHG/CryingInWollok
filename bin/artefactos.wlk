import efectosGlobales.*
import refuerzos.*
import rolando.*

object espadaDelDestino {	
	method unidadesDeLucha() = 3
}

object collarDivino {
	var property perlas = 5
	method unidadesDeLucha() = perlas
}


object mascaraOscura {
	method unidadesDeLucha() = 4.max(fuerzaOscura.valor()/2)
}

object armadura{
	var property refuerzo = cotaDeMallas
	var property duenio = rolando
	
	method unidadesDeLucha() = 2 + refuerzo.valor(duenio)
}

object espejoFantastico{
	var property duenio = rolando
	
	method unidadesDeLucha(){
		if(duenio.artefactos().size() <= 1){
			return 0
		}else{
			return duenio.mejorArtefacto().unidadesDeLucha()
		} 
	}
}
