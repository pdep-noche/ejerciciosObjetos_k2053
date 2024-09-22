object pepe {
	
	var categoria = cadete
	var cantDeFaltas = 3
	var bonoPresentismo = bonoDependeDeFaltas
	var bonoResultado = bonoFijo
	
	method cantDeFaltas(cant) {
		cantDeFaltas = cant
	}
	
	method bonoResultado(unBono){
		bonoResultado = unBono
	}
	
	method bonoPresentismo(unBono) {
		bonoPresentismo = unBono
	}
	
	method categoria(unaCate) {
		categoria = unaCate
	}
	method sueldo() {
		return categoria.neto() + bonoPresentismo.monto(cantDeFaltas) + bonoResultado.monto(categoria.neto()) 
	}	
}

object bonoPorcentaje {	
	method monto(neto) = neto * 0.1
}

object bonoFijo {
	method monto(_) = 800
}

object bonoNulo {
	
	method monto(_) = 0	
}


object bonoDependeDeFaltas{
	
	method monto(faltas) {
		if (faltas == 0) {
			return 1000
		}
		if (faltas == 1) {
			return 500
		}
		return 0		
	}
}



object cadete {
	var neto = 15000
	
	method neto() = neto
	 
}

object gerente{
	var neto = 10000
	method neto()= neto
		
}
