class Barco {
	const property tripulantes = []
	var property mision
	
	method piratasUtilesParaMision() {
		return tripulantes.filter({tripu => mision.esUtil(tripu)})
	}
 	
	
}

class Pirata {
	
	var property edad
	var property temenMorir
	const property items  = []
	
	method esIntrepido() {
		return edad < 40 && !temenMorir		
	}
	
	method cantItems() = items.size()
}

class Mision {
	
	method esUtil(tripulante) {
		return tripulante.esIntrepido() && self.cumplirCondicion(tripulante)
	}
	
	method cumplirCondicion(tripulante)
}


object convertirseLeyenda inherits Mision {
	
	override method cumplirCondicion(tripulante) {
		return tripulante.cantItems() > 10		
	}
}

object busquedaTesoro inherits Mision {
	
	override method cumplirCondicion(tripulante) {
		return tripulante.tieneItem("brujula") || 
		tripulante.tieneItem("botellaGrogXD")
	}
		
}

class Saqueo inherits Mision{
	var property objetivo
	var property cantNecesaria
	
	override method cumplirCondicion(tripulante) {
		
		return tripulante.cantMonedas() <= cantNecesaria
		
	}
	
}



 