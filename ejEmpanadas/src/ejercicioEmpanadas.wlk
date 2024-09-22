object negocio {
	
	var disponible = 50000
	
	method pagarA(unEmpleado) {
		disponible = disponible - unEmpleado.sueldo()
	}
	
	method disponible(){
		return disponible
	}
	
}

object galvan {
	
	var sueldo = 15000
	
	method sueldo(){
		return sueldo
	}
}

object baigorria {
	
	var montoEmpanada = 15
	var cantidadDeEmpanadasVendidas = 100 
	
	method sueldo() {
		return montoEmpanada * cantidadDeEmpanadasVendidas
	}
	
	method venderEmpanada() {
		cantidadDeEmpanadasVendidas += 1
	}
}


