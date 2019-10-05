class Enfermedad {
	var property cantidadCelulas
	method atenuar(cantMedicamento){
		cantidadCelulas -= cantMedicamento * 15
	}
}

class Infecciosa inherits Enfermedad{
	var property nombre
	var property cantDiasAfectado = 0
	const porcentaje_celulas = 10
	
	method reproducirse(){
		cantidadCelulas *= 2
	}
	
	method afectar(persona){
		var nueva_temp = (cantidadCelulas / 1000) + persona.temperatura()
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

class AutoInmune inherits Enfermedad{
	var property nombre
	var property cantDiasAfectado = 0
	var cantidadDias = 30
	
	
	method esAgresiva(){
		return cantDiasAfectado > cantidadDias
	}
	
	method afectar(persona){
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
	
	method vivirUnDia(){
		lista_enfermedades.forEach {enfermedad => self._afectar(enfermedad)}
	}
	
	method _afectar(enfermedad){
		const m = {
			enf => enf.afectar(self); enf.cantDiasAfectado(enf.cantDiasAfectado() + 1)
		}
		m.apply(enfermedad)
	}
	
	method tomar(cantidad){
		lista_enfermedades.forEach {enfermedad => enfermedad.atenuar(cantidad)}
	}
}

class Medico inherits Persona {
	
	override method contraerEnfermedad(enfermedad){
		super(enfermedad)
		self.tomar(100)
	}	
}

