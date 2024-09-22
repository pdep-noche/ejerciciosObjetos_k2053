object sara {
	
	var peso = 55
	var vitalidad = 90
	var temperatura = 37
	
	method temperatura() = temperatura
	
	method temperatura(cant) {
		temperatura = cant
	}
	
	method peso() = peso
	
	method vitalidad() = vitalidad
	
	method esAfectadaPor(algo) {
		algo.afectarA(self)
	}
	
	method modificarTemperatura(cant){
		temperatura += cant
	}
	
	method modificarPeso(cant) {
		peso += cant
	}
	
	method modificarVitalidad(cant) {
		vitalidad += cant
	}
}

object malaria {
	
	method afectarA(persona) {
	 	persona.modificarTemperatura(3)
	}
}


object varicela {
	
	method afectarA(persona) {
		persona.modificarVitalidad(-5)
		persona.modificarPeso(-persona.peso()*0.1)
	}
}

object gripe {
	
	method afectarA(persona){
		persona.modificarVitalidad(-persona.vitalidad()*0.2)
	}
}

object paracetamol {
	
	method afectarA(persona){
		if(persona.temperatura() > 37) {
			persona.temperatura(37)
		}
	}
}


object polen {
	
	var cantGramos = 10
	
	method afectarA(persona) {
		persona.modificarVitalidad(cantGramos*0.1)	
	}
	
}

object nuez {
	
	method afectarA(persona) {
		persona.modificarVitalidad(persona.vitalidad() * 0.3)
	}
}