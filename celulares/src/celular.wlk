class Celular { 
	
	var property memoria = 1000
	const property aplicaciones = []
	const property bateria = 100
	
	method memoriaRamLibre() {
		return memoria - self.consumoAplicaciones()
	}
	
	method consumoAplicaciones() {
		return aplicaciones.sum({unApli => unApli.consumoMemoria()})	
	}
	method bateriaRestante() = 100 - self.consumoBateria()
	method consumoBateria() =  aplicaciones.sum({unApli => unApli.consumoBateria()})
	
		
	method agregarAplicacion(unaAplicacion) {
		aplicaciones.add(unaAplicacion);
	}
}

class Mensajeria { 
	var property cantConversaciones
	var property memoriaBase 
	var property memoriaPorConversacion
	var property gastoBateria = 1
	
	
	method consumoBateria()  = cantConversaciones * gastoBateria
		
	
	method consumoMemoria(){
		return memoriaBase + (cantConversaciones*memoriaPorConversacion)
	}
}

class Reproductor {
	var property cantElementos 
	var property cantMemoriaPorElemento
	var property maximoOcupa
	var property consumoBateria = 2
	
	method consumoMemoria() {
		return  maximoOcupa.min(cantMemoriaPorElemento * cantElementos)		
	}		
}

object calculadora {
	var property consumoMemoria = 10
	var property consumoBateria = 0
	
}
