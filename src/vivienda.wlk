
class Vivienda {
	
	var horasNecesarias
	var familiaOcupante
		
	constructor(horas){
		horasNecesarias = horas
	}

	method horasNecesarias(){return horasNecesarias}
	
	method descontarHoras(horas) {
		horasNecesarias -= horas
	}
	
	method adecuadaPara( familia){
		return self.minimaDiferenciaEntre( self.cantidadPersonas(), familia.cantidadIntegrantes())
	}
	method minimaDiferenciaEntre(disponibilidad, necesidad) {
		return (disponibilidad - necesidad).abs() <= 1 
	} 
	
	method estaLibre() {
		return familiaOcupante == null
	}
	method estaTerminada() {
		return horasNecesarias <= 0
	}
	
	method ocupadaPor(familia) { 
		familiaOcupante = familia
	}
	
	method cantidadPersonas()
		
}

class Casa inherits Vivienda{
	var ambientes 
	
	constructor(horas, ambtes)=super(horas){
		ambientes = ambtes
	}
	override method cantidadPersonas(){
		return ambientes.sum()
	}
}

class Depto inherits Vivienda{
	var superficie 
	constructor(horas, sup)=super(horas){
		superficie = sup
	}
	override method cantidadPersonas(){
		return superficie.div(15)
	}
}

