
object mutual {
	var horasMinimas = 200
	var familias = []
	var viviendas = []
	
	// Punto 1
	// Incorporar una nueva vivienda a la mutual, teniendo en cuenta que puede tratarse de casa o departamento y que se debe registrar la cantidad de horas de trabajo necesarias.
	
	method agregarVivienda(vivienda){viviendas.add(vivienda)}
	
	method agregarFlia(flia){familias.add(flia)}
	method horasMinimas(){return horasMinimas}
	
	//Punto 4
	// Para una vivienda dada, obtener todos los socios que aún no tengan casa propia, que estén al día y que entren justo en esa vivienda. 
	
	method candidatosPara(vivienda){
		return familias.filter{familia=>vivienda.adecuadaPara(familia) and familia.sinTecho() and familia.alDia()} 
	}
	//Punto 5
	// Calcular la cantidad de socios diferentes en las que al menos uno de sus integrantes trabajó en una determinada vivienda.
	
	method familiaQueTrabajaronEn(vivienda){
		return familias.count{familia=>familia.trabajoEn(vivienda)}
	}
	//Punto 6
	//Asignar la vivienda a la familia socia que esté en condiciones que más trabajó. 
	
	method asignarVivienda(vivienda){
		var candidatos = self.candidatosPara(vivienda)
		
		if(candidatos.isEmpty())
			throw new Exception("no hay familias en condiciones para la casa") 
		
		var familia = candidatos.max{flia=>flia.horasTrabajadas()}
		familia.recibirVivienda(vivienda)
	}
	//Punto 7
	//Intentar asignar todas las viviendas terminadas de la mutual a todas las familias socias que sea posible.
	
	method asignarTodasViviendas(){
		self.viviendasLibresTerminadas().forEach({vivienda=>self.asignarVivienda(vivienda)})
	}
	
	method viviendasLibresTerminadas(){
		return viviendas.filter{vivienda=>vivienda.estaLibre() and vivienda.estaTerminada()} 
	}
	
}