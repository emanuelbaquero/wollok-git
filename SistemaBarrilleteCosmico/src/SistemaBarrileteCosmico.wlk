class NoPuedeViajarExcepcion inherits Exception {}

class Localidad{
	const property nombre
	var equipajeImprescindible = []
	var property precio
	var property kilometro
	
	method getEquipaje(equipaje) = equipajeImprescindible.filter {unEquipaje => unEquipaje == equipaje}
	
	method distanciaA(otraLocalidad) = (kilometro - otraLocalidad.kilometro()).abs()
	
	method equipajes() = equipajeImprescindible
	
	method esLocalidadPeligrosa() = equipajeImprescindible.any {equipaje => equipaje.contains('Vacuna')}
	
	method aplicarDescuento(porcentaje){
		precio -= precio * (porcentaje / 100)
		equipajeImprescindible.add('Certificado de descuento')
	}
	
	method agregar_equipaje(equipaje){
		equipajeImprescindible.add(equipaje)
	} 
	
}

class Empresa{
	const cantidadMinimaDestinoImportante = 2000
	const property nombre
	var property mediosDeTransporte = new List()
	var localidades = new List()
	
	method localidadesMasImportantes() = localidades.filter {localidad => localidad.precio() >= cantidadMinimaDestinoImportante}
	
	method mostrarCartaLocalidades() = localidades.map {localidad => localidad.nombre()}
	
	method localidades() = localidades
	
	method getLocalidadPorNombre(nombreLocalidad) = localidades.find {localidad => localidad.nombre() == nombreLocalidad}
	
	method getMedioTransporteRandom() = mediosDeTransporte.anyOne()
	
	method getMedioTransporte(_medio) = mediosDeTransporte.find {medio => medio == _medio}
	
	method aplicarDescuentoLocalidades(cantDescuento){
		localidades.forEach {localidad => localidad.aplicarDescuento(cantDescuento)}
	}
	
	method esEmpresaExtrema(){
		var listaLocalidades = self.localidadesMasImportantes()
		return listaLocalidades.any {localidad => localidad.esLocalidadPeligrosa()}
	}
	
	method aplicarDescuento(cantDescuento, unaLocalidad){
		var localidad = self.getLocalidadPorNombre(unaLocalidad)
		localidad.aplicarDescuento(cantDescuento)
	}
	
	method prepararViaje(localidadOrigen, localidadDestino){
		return new Viaje(
			origen = localidadOrigen,
			destino= localidadDestino,
			medioTransporte = self.getMedioTransporteRandom())
	}
	
}

class Usuario{
	var property empresa
	const property nombre
	var viajesRealizados = new List()
	var localidadOrigen
	var balanceEnCuenta
	var siguiendo = new List()
	
	method getLocalidadOrigen() = localidadOrigen

	method getViajesRealizados() = viajesRealizados
	
	method siguiendo() = siguiendo
	
	method balance() = balanceEnCuenta
	
	method puedeViajar(viaje) = balanceEnCuenta >= viaje.costo()
	
	method agregarViaje(viaje) {viajesRealizados.add(viaje)}
	
	method setLocalidadOrigen(nuevaLocalidad) {
		localidadOrigen = nuevaLocalidad
	}
	
	method disminuirBalance(disminucion) { // no arrojo una excepcion porque por negocio siempre se valida si puede viajar primero
		balanceEnCuenta -= disminucion
	}
	
	method viajarA(localidaDestino) {
		var viaje = empresa.prepararViaje(self.getLocalidadOrigen(), localidaDestino)		
		if(!self.puedeViajar(viaje)) throw new NoPuedeViajarExcepcion(message = "No cuenta con el balance suficiente para viajar")
	
		self.disminuirBalance(viaje.costo())
		self.agregarViaje(viaje)
		self.setLocalidadOrigen(viaje.destino())
	}
	
	method getKilometrosRecorridos() {
		var lista_distancias = viajesRealizados.map { viaje => viaje.distancia()}
		return lista_distancias.sum()
	}

	
	method seguirUsuario(usuario){
		siguiendo.add(usuario)
		usuario.siguiendo().add(self)
	}
	
}

class Viaje{
	var property origen
	var property destino
	var property medioTransporte
	
	method costo() = medioTransporte.precioPorKm() * self.distancia() + destino.precio()
	
	method distancia() = origen.distanciaA(destino)
}

class MedioTransporte {
	var property nombre
	var property precioPorKm
	var property duracionViaje
}

object generador{
	
	method unUsuario(_localidadOrigen, _balance){
		var empresa = self.barrileteCosmico()
		var localidadOrigen = _localidadOrigen
		var balance = _balance
		return new Usuario(nombre = "Un Usuario", 
						   localidadOrigen = localidadOrigen, 
						   balanceEnCuenta = balance, 
						   empresa = empresa
		)
	}
	
	method pHari(){
		var empresa = self.barrileteCosmico()
		var localidadOrigen = self.garlicSea()
		var balance = 15000
		return new Usuario(nombre = "Un Usuario", 
						   localidadOrigen = localidadOrigen, 
						   balanceEnCuenta = balance, 
						   empresa = empresa
		)
	}
	
	method barrileteCosmico(){
		var nombre = "Barrilete Cosmico"
		var mediosDeTransporte = self.muchosMediosdeTransporte()
		var localidades = self.lista_localidades()
		return new Empresa(
			nombre = nombre, mediosDeTransporte = mediosDeTransporte, localidades = localidades
		)
	}
	
	method garlicSea(){
		var nombre = "Garlic's Sea"
		var equipaje = ["Caña de Pescar", "Piloto"]
		var precio = 2500
		var kilometro = 55
		return new Localidad(nombre = nombre, precio = precio, 
			equipajeImprescindible = equipaje, kilometro = kilometro
		)
	}
	method silverSea(){
		var nombre = "Silver's Sea"
		var equipaje = ["Protector Solar", "Equipo de Buceo"]
		var precio = 1350
		var kilometro = 90
		return new Localidad(nombre = nombre, precio = precio, 
			equipajeImprescindible = equipaje, kilometro = kilometro
		)
	}
	method lastToninas(){
		var nombre = "Last Toninas"
		var equipaje = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
		var precio = 3500
		var kilometro = 10
		return new Localidad(nombre = nombre, precio = precio, 
			equipajeImprescindible = equipaje, kilometro = kilometro
		)
	}
	method goodAirs(){
		var nombre = "Good Airs"
		var equipaje = ["Cerveza", "Protector Solar"]
		var precio = 1500
		var kilometro = 25
		return new Localidad(nombre = nombre, precio = precio, 
			equipajeImprescindible = equipaje, kilometro = kilometro
		)
	}
	
	method lista_localidades(){
		return [self.goodAirs(), self.lastToninas(), self.silverSea(), self.garlicSea()]
	}
	
	method muchosMediosdeTransporte(){
		var cantidad = 5
		var precioMinimo = 50
		var precioMaximo = 100
		var duracionMinimaViaje = 5
		var duracionMaximaViaje = 30
		var lista_transportes = []
		cantidad.times{i =>
			var precioPorKm = precioMinimo.randomUpTo(precioMaximo);
			var duracionViaje = duracionMinimaViaje.randomUpTo(duracionMaximaViaje);
			var nombre = "Transporte " + i.toString();
			lista_transportes.add(new MedioTransporte(nombre = nombre, precioPorKm = precioPorKm, duracionViaje = duracionViaje));
		}
		return lista_transportes
	}
	
}


