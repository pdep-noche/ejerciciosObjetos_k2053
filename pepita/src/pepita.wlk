object pepita {
	
	var energia = 100
	
	method vola(metros) {
		energia = energia - metros
		
	}
	
	
	method comer(gramos) {
		energia = energia +	(gramos * 2)
	}
	
	method energia(unaEnergia){
		energia = unaEnergia;
	}
	
	
	method energia() {
		return energia
	}
}
