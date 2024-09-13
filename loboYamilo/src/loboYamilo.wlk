object yamilo {
	
	
	var calorias = 300
	
	method calorias() {
		return calorias
	}
	
	method comer(chanchito) {
		calorias = calorias + (chanchito.peso()/10)
	}
	
	method estaConSobrepeso() {
		return calorias > 200
	}
	
	method estaSaludable() {
		return calorias.between(20, 150)
	}
	
	method correr(tiempo) {
		calorias = calorias - (2*tiempo)
	} 
	
}

object chanchitoCasaPaja {
	
	
	var peso = 100
	
	method peso() {
		return peso
	}
	
	method peso(unPeso) {
		peso = unPeso
	}
}
