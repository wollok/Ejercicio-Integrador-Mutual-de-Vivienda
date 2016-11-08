import mutual.*

class Familia {

	var titular
	var integrantes = []
	var sinTecho = true
	
	constructor( tit, otros ){
		titular = tit
		integrantes = otros
		integrantes.add(tit)
	}
	
	method cantidadIntegrantes(){
		return integrantes.size()
	}
	
	method sinTecho(){
		return sinTecho
	}
	// Punto 3
	// Saber si un socio está al día, habiendo alcanzado el mínimo de horas de trabajo.
	method alDia(){
		return self.horasTrabajadas() > mutual.horasMinimas() 
	}
	
	method horasTrabajadas(){
		return integrantes.sum{persona => persona.horasTrabajadas() }
	}
	
	method trabajoEn(vivienda){
		return integrantes.any{persona =>persona.trabajoEn(vivienda)}
	}
	
	method recibirVivienda(vivienda){
		vivienda.ocupadaPor(self)
		sinTecho = false 
	}
}

class Persona {
	var edad
	var trabajosRealizados = []
	
	constructor( ed){
		edad = ed
	}
	method edad() {return edad}
	
	method horasTrabajadas(){ 
		return trabajosRealizados.sum{trabajo=>trabajo.horas()}
	}
	
	// Punto 2
	// Registrar el trabajo que hace una persona en una vivienda. (Se considera un error que trabaje un menor  de edad) .
	method trabajar(horas, vivienda, descripcion){
		if( edad < 18)
			throw new Exception("NO a la explotacion infantil")
		trabajosRealizados.add( new TrabajoRealizado(horas, vivienda, descripcion))	
		vivienda.descontarHoras(horas)
	}

	method trabajoEn(vivienda){
		return trabajosRealizados.any{trabajo=>trabajo.vivienda()== vivienda}
	}
}

class TrabajoRealizado{
	var horas
	var vivienda
	var descripcion

	constructor(hs, viv, desc){
		horas = hs
		vivienda = viv
		descripcion = desc
	}
	
	method horas(){return horas}
	method vivienda(){return vivienda}
}

class Especialista inherits Persona{
	var habilidad
	constructor(edad, hab) = super( edad) {
		habilidad = hab
	}
	override method horasTrabajadas(){
		return super()*habilidad.rendimiento()
	}
}

class Habilidad{
	var rendimiento 
	constructor( rend ) {rendimiento = rend}
	method rendimiento( rend ) {rendimiento = rend}
	method rendimiento() {return rendimiento}
}



