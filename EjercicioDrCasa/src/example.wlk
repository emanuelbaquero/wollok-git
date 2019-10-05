class Infecciosa {
	var property cantidadCelulas
	var property nombre
	const porcentaje_celulas = 10
	
	method reproducirse(){
		cantidadCelulas *= 2
	}
	
	method aumentarTemperatura(persona){
		var nueva_temp = (persona.temperatura() / 1000) + persona.temperatura()
		var mensaje
		if (nueva_temp <= 45) {
			persona.temperatura(nueva_temp)
			mensaje = "La nueva temperatura de " + persona.nombre() + "es: " + persona.temperatura()
		}else{
			mensaje = "No se puede aumentar la temperatura de " + persona.nombre() + " ya que superaria los 45°C"
		}
		return mensaje
	}
	
	method esAgresiva(persona){
		var celulas = persona.cantidadCelulas() * (porcentaje_celulas / 100)
		return celulas > cantidadCelulas
	}
	
}

class AutoInmune {
	var property cantidadCelulas
	var property nombre
	var cantidadDias = 30
	
	method esAgresiva(persona){
		return persona.diasAfectado() > cantidadDias
	}
	
	method destuirCelulas(persona){
		var nueva_cant = persona.cantidadCelulas() - cantidadCelulas
		persona.cantidadCelulas(nueva_cant)
	}
}

class Persona {
	var property nombre
	var property temperatura
	var property cantidadCelulas
	var property lista_enfermedades = new List()
	
	method contraerEnfermedad(enfermedad){
		lista_enfermedades.add(enfermedad)
	}
	
	method getNombreEnfermedades(){
		return lista_enfermedades.map {x => x.nombre()}
	}
	
	method getCantidadCelulasEnfermedades(){
		return lista_enfermedades.map {x => x.cantidadCelulas()}
	}
}

