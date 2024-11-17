/** First Wollok example */
class Entrada {
	
	var property banda
	var property fecha
	var property precioBase
	var property precioFinal
	
	method precioAlPublico() {
		return precioBase + productora.impuesto()
	}
	
	method nombreBanda() = banda.nombre()
}

object productora {
	var property impuesto
	const property asistentes = []
	
	method gananciaTotal() {
		return 	self.totalRecaudado() - self.presupuestoBandas()
	}
	
	method totalRecaudado() {
		return asistentes.sum({unAsistente => unAsistente.totalGastadoEntradas()})
	}
	
	method presupuestoBandas() {
		return self.bandas().sum({unaBanda => unaBanda.presupuesto()})
		
	}
	
	method bandas() {
		const bandasAsistentes = #{}
		asistentes.forEach({unAsistente => 
			bandasAsistentes.addAll(unAsistente.bandas())
		})
		
		return bandasAsistentes
	}
	
	method cantEntradasVendidas() {
		return asistentes.sum({unAsistente => unAsistente.cantEntradas()})
	}
	
	method bandaMasPopular() {
		self.bandas().max({unaBanda => unaBanda.popularidad()})
	}
}

class Asistente {
	
	var property abono
	const property entradas = []
	var property saldo
	
	method comprarEntrada(entrada) {
		self.validarCompra(entrada)
		self.comprar(entrada)
	}
	
	method validarCompra(entrada) {
		if(saldo < 0) {
			throw new SaldoNegativo(message= "no puede comprar entrada")
		}
	}
	
	method comprar(entrada) {
		var precioFinal =  abono.precioConDescuento(entrada.precioAlPublico())
		saldo -= precioFinal
		entrada.precioFinal(precioFinal)
		entradas.add(entrada)
	}
	
	method totalGastadoEntradas() {
		return entradas.sum({unaEntrada => unaEntrada.precioFinal()})
	}
	
	method nombreBandas() {
		return entradas.map({entrada => entrada.nombreBanda()}).asSet()
	}
	
	method bandas() {
		return entradas.map({entrada => entrada.banda()}).asSet()
	}
	
	method cantEntradas() = entradas.size()
	
	
}

class SaldoNegativo inherits DomainException { }

object fan {
	
	method precioConDescuento(precio)  = precio
	
}
class Vip {
	var property porcentajeDescuento
	method precioConDescuento(precio) {
		return precio - (precio*porcentajeDescuento/100)
	}
	
	method incrementarDescuento(cant) {
		porcentajeDescuento += cant
		
	} 
}

class Banda {
	
	var property nombre
	var property canon = 1000000
	
	method presupuesto() = canon + self.gastoExtra()
	
	method gastoExtra() = 0
	
	method popularidad()
	
}

class Rock inherits Banda {
	
	var property solosGuitarra 
	
	override method gastoExtra() = 10000
	
	override method popularidad() = 100 * solosGuitarra
	
}

class Trap inherits Banda {
	
	var property tieneHielo
	
	override method popularidad() {
		if (tieneHielo) {
			return 1000
		}
		return 0
	}
	
	override method canon() =  super() * self.popularidad() 
	
	
}

class Indie inherits Banda {
	var property cantInstrumentos
	
	override method popularidad() = 3.14 * self.largoNombreBanda()
	
	method largoNombreBanda() = nombre.size()
	
	override method gastoExtra() = 500 * cantInstrumentos
}


