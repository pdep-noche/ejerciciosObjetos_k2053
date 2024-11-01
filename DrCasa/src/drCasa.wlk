class Persona {
	
	const property enfermedades = []
	var property temperatura
	var property cantCelulas
	
	
	method contraer(enfermedad){
		enfermedades.add(enfermedad)
	}
	
	method modificarTemperatura(cantidad) {
		temperatura = 45.min(cantidad + temperatura)
	}
	
	method modificarCantCelulas(cantidad) {
		cantCelulas = 0.max(cantCelulas + cantidad)
	}

	method vivirUnDia() {
		enfermedades.forEach({unEnfermedad => unEnfermedad.afectarA(self)})
	}	
}

class Enfermedad {
	
	var property cantCelulasAfectadas
	
	method afectarA(persona)
	
}

class Infecciosa inherits Enfermedad {
	
	
	override method afectarA(persona){ 
		persona.modificarTemperatura(cantCelulasAfectadas/1000)
	}
	
	method esAgresiva(persona) {
		return cantCelulasAfectadas > persona.cantCelulas() * 0.001
	}
	
	method reproducirse() {
		cantCelulasAfectadas *= 2
	}
}

class Autoinmune inherits Enfermedad {
	var property cantDias = 0
	
	override method afectarA(persona) {
		persona.modificarCantCelulas(-cantCelulasAfectadas);
		cantDias += 1
	}
	
	method esAgresiva(persona) = cantDias > 30
	
}