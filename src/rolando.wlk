import spells.*
import efectosGlobales.*
import artefactos.*

object rolando {
	var property valorBaseLucha = 1
	var property valorBaseHechiceria = 3 
	
	var property artefactos = #{}
	var property hechizos = #{espectroMalefico,hechizoBasico}
	
	var property hechizoPreferido = espectroMalefico
	
	method habilidadLucha() = valorBaseLucha + artefactos.sum({artefacto => artefacto.unidadesDeLucha()})

	method nivelDeHechiceria() = valorBaseHechiceria* hechizoPreferido.poder() + fuerzaOscura.valor()
	
	method seCreePoderoso() = hechizoPreferido.esPoderoso()
	
	method agregarArtefacto(artefacto){
		artefactos.add(artefacto)
	}
	method removerArtefacto(artefacto){
		artefactos.remove(artefacto)
	}
	
	method luchaMayorHechiceria() = self.habilidadLucha() > self.nivelDeHechiceria()
	
	method mejorArtefacto(){
		return artefactos.filter({artefacto => artefacto != espejoFantastico}).max({artefacto => artefacto.unidadesDeLucha()})
	}
	method estaCargado() = artefactos.size() >= 5
	
	
		
}
