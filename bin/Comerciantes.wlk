import efectosGlobales.*
import artefactos.*

object comisionador{
	method valor(valorBase,porcentaje)= valorBase + valorBase*porcentaje
	method valorConImponible (valorBase, porcentaje) = valorBase + (0.max(valorBase - minimoNoImponible.impuesto())*porcentaje)
}

object tipoIndependiente{
	var property comision = 0
	method precio(artefacto) = comisionador.valor(artefacto.monedas(),comision)
	method recategorizado() {
		comision *=2
		if(comision > 0.21){
			return tipoRegistrado
		}
		return self
	}
}

object tipoRegistrado{
	const iva = 0.21
	method precio(artefacto) = comisionador.valor(artefacto.monedas(),iva)
	method recategorizado() = tipoImpuestoGanancia
}

object tipoImpuestoGanancia{
	const recargo = 0.35
	method precio(artefacto) = comisionador.valorConImponible(artefacto.monedas(),recargo)
	method recategorizado() = self
}

class Comerciante{
	var property tipo
	constructor(unTipo){
		tipo = unTipo
	}
	method precio(artefacto){
		return tipo.precio(artefacto)
	}
	method recategorizar(){
		tipo = tipo.recategorizado()
	}
}