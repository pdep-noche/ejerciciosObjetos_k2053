class EspacioUrbano {
	
	var property superficie
	var property valuacion
	var property tieneVallado
	const property trabajosRealizados
	
	method esGrande()  {
		return superficie > 50 && self.cumpleCondiciones()
	}
	
	method esEspacioVerde() = false
	
	method esLimpiable() = false
	
	method cumpleCondiciones()
	
	method aumentarValuacion(valor) {
		valuacion += valor
	}
	
	
}

class Plaza inherits EspacioUrbano {
	var property cantCanchas
	var property espacioEsparcimiento
	
	override  method cumpleCondiciones()  {
		return cantCanchas > 2
	}
	override method esLimpiable() = true
 	
	override method esEspacioVerde() = cantCanchas == 0
	
}

class Plazoleta inherits EspacioUrbano {
	var property procer
	var property espacioSinCesped
	
	override method cumpleCondiciones() {
    return 	procer == "San Martin" && tieneVallado 
		 
	}
	
}

class Anfiteatro inherits EspacioUrbano {
	var property capacidad
	var property tamaniooEscenario
	override method cumpleCondiciones() = capacidad > 500
	override method esLimpiable() = self.esGrande()
}

class Multiespacio inherits EspacioUrbano {
	
	const property espaciosUrbanos = []
	
	override method cumpleCondiciones() {
		return espaciosUrbanos.all({unEspacio => unEspacio.esGrande()})
		
	}
	
	override method esEspacioVerde() = espaciosUrbanos.size() > 3 
}
class Trabajador {
	
	var property profesion
	
	method trabajarEn(espacioUrbano){
		profesion.realizarTrabajo(espacioUrbano, self)
	}
	
	method valorHora() = profesion.valorHora()
}

class Profesion {
	
	method realizarTrabajo(espacioUrbano, trabajador) {
		self.validarTrabajoEn(espacioUrbano)
		self.realizarEfecto(espacioUrbano)
		self.registrarTrabajo(espacioUrbano, trabajador)
	}
	
	method valorHora() =  1000
	
	method registrarTrabajo(espacioUrbano, trabajador) {
		espacioUrbano.agregarTrabajo(self.nuevoTrabajo(espacioUrbano, trabajador) )
	}
	
	method nuevoTrabajo(espacioUrbano, trabajador) {
		return new Trabajo(persona = trabajador, duracion= self.duracionTrabajo(espacioUrbano), costo = self.costoTrabajo(espacioUrbano, trabajador))
	}
	
	method costoTrabajo(espacioUrbano, trabajador) {
		return trabajador.valorHora() * self.duracionTrabajo(espacioUrbano)
	}
	
	method duracionTrabajo(espacioUrbano)
	
	method validarTrabajoEn(espacioUrbano) {
		if (!self.puedeRealizarTrabajoEn(espacioUrbano)) {
			throw new TrabajoIncompatible(message = "no es un trabajo compatible")
		}
	}
	
	method puedeRealizarTrabajoEn(espacio)
	
	method realizarEfecto(espacio)
	
}


class TrabajoIncompatible inherits DomainException{}


object cerrajero inherits Profesion {
	
	
	override method puedeRealizarTrabajoEn(espacioUrbano) {
		return !espacioUrbano.tieneVallado()
	}
	
	override method duracionTrabajo(espacioUrbano) {
		if (espacioUrbano.esGrande()) {
			return 5}
		return 3
		}
		
	override method realizarEfecto(espacio) {
		espacio.tieneVallado(true)
	}
	
}

object jardinero inherits Profesion {
	override method duracionTrabajo(espacioUrbano) {
		return espacioUrbano.superficie()/10
	}
	
	override method valorHora() = 2500
	
	override method puedeRealizarTrabajoEn(espacioUrbano) {
		return espacioUrbano.esEspacioVerde()
	}
	
	override method realizarEfecto(espacio) {
		espacio.aumentarValuacion(espacio.valuacion() *0.1)
	}
}

object encargado inherits Profesion {
	override method duracionTrabajo(_) = 8
	
	override method puedeRealizarTrabajoEn(espacioUrbano) {
		return espacioUrbano.esLimpiable()
	}
	
	override method realizarEfecto(espacio) {
		espacio.aumentarValuacion(5000)
	}
}

class Trabajo {
	var property duracion
	var property persona;
	var property costo
	var property fecha = new Date();
}