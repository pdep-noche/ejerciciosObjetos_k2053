object andy {
	
	const property librosLeidos = [misterioPrincipe, 
		las2Torres,elPrincipito,juegosDelHambre,
		venasAbiertasAmericaLatina, rayuela]	
		
	method primerLibroLeido()  = librosLeidos.first()
	
	method ultimoLibroLeido() = librosLeidos.last()
	
	method cantLibrosLeidos() = librosLeidos.size()
	
	method olvidarPrimerLibroLeido() {
		librosLeidos.remove(self.primerLibroLeido())
	}

}

object misterioPrincipe {
	var property cantLectores = 10500156
	
	
	method valoracion() = cantLectores/ 1000000
	
	
}


object las2Torres {
	var property cantPaginas
	
	method valoracion() = cantPaginas/45
	
	
}

object elPrincipito {
	method valoracion() = 50
}

object juegosDelHambre {
	
	var property votosPositivos = 1600200
	var property votosNegativos = 300600 
	
	method coeficiente() = votosPositivos - votosNegativos
	
	method valoracion() {
		if (self.coeficiente() > 0 ) {
			return self.coeficiente() / 100000
		}
		return 0
	}
	
}

object venasAbiertasAmericaLatina {
	
const property anioPublicacion = 1971

	method valoracion() {
		return self.cantAniosPublicacion()/3
	}
	
	method cantAniosPublicacion() {
		const fechaHoy = new Date()
		return fechaHoy.year() - anioPublicacion
	}

}

object rayuela {
	const titulo = "Rayuela"
	
	method cantLetras() = titulo.size()
	
	method valoracion() = self.cantLetras() * 2
}