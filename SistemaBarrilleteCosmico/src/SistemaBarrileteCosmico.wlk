object garlicSea{
	const property nombre = "Garlic's Sea"
	var property equipajeImprescindible = ["Caña de Pescar", "Piloto"]
	var property precio = 2500
}

object silverSea{
	const property nombre = "Silver's Sea"
	var property equipajeImprescindible = ["Protector Solar", "Equipo de Buceo"]
	var property precio = 1350
}

object lastToninas{
	const property nombre = "Last Toninas"
	var property equipajeImprescindible = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
	var property precio = 3500
}

object goodAirs{
	const property nombre = "Good Airs"
	var property equipajeImprescindible = ["Cerveza", "Protector Solar"]
	var property precio = 1500
}

object barrileteCosmico{
	var cantidadMinimaDestinoImportante = 2000
	var property destinos = [garlicSea, silverSea, lastToninas, goodAirs]
	
	method destinosMasImportantes(){
		var lista_destinos = destinos.filter {x => x.precio() >= cantidadMinimaDestinoImportante}
		return self.getDestinosPorNombre(lista_destinos)
	}
	
	method aplicarDescuento(cantDescuento, unDestino){
		var destino = self.getDestinoPorNombre(unDestino)
		var nuevo_precio = self.calcularDescuento(destino.precio(), cantDescuento) 
		destino.precio(nuevo_precio)
		destino.equipajeImprescindible().add("Certificado de descuento")
	}
	
	method esEmpresaExtrema(){
		var listaDestinos = self.destinosMasImportantes()
		return listaDestinos.any {destino => self.destinoTieneVacuna(destino)}
	}
	
		
	method destinoTieneVacuna(destino){
		return destino.equipajeImprescindible().any {equipaje => equipaje.contains('Vacuna')}
	}
	
	method calcularDescuento(precio, cantDescuento){
		const formula = {precio_original, cant_descuento => precio_original - (precio_original * (cant_descuento / 100))}
		return formula.apply(precio, cantDescuento)
	}
	
	method mostrarCartaDestinos(){
		return self.getDestinosPorNombre(destinos)
	}
	
	method getDestinoPorNombre(destino){
		return destinos.find {x => x.nombre() == destino}
	}
	
	method getDestinosPorNombre(listaDestinos){
		return listaDestinos.map {x => x.nombre()}
	}
	
}

object pHari {
	const property nombre = "Pablo Hari"
	var empresa = barrileteCosmico
	var property destinosConocidos = ["Last Toninas", "Good Airs"]
	var property balanceEnCuenta = 1500
	var property siguiendo = []
	
	method volarDestino(nombreDestino){
		var mensaje = ""
		var destino = empresa.getDestinoPorNombre(nombreDestino) 
		if (self.puedeVolarDestino(destino)){
			balanceEnCuenta -= destino.precio()
			self.agregarDestino(nombreDestino)
			mensaje = "Pudo viajar Correctamente"
		}else{
			mensaje = "No cuenta con el saldo suficiente para viajar. Tiene " + balanceEnCuenta + " $ y necesita " + destino.precio() + " $"
		}
		return mensaje
	}
	
	method puedeVolarDestino(destino){
		return balanceEnCuenta >= destino.precio()		
	}
	
	method agregarDestino(nombreDestino){
		destinosConocidos.add(nombreDestino)
	}
	
	method getKilometrosRecorridos(){
		return (self.getMontoTotalRecorrido() * 10) / 100
	}
	
	method getMontoTotalRecorrido(){
		var lista_precios = []
		destinosConocidos.forEach {nombreDestino => lista_precios.add(empresa.getDestinoPorNombre(nombreDestino).precio())}
		return lista_precios.sum()
	}
	
	method seguirUsuario(usuario){
		siguiendo.add(usuario.nombre())
		usuario.siguiendo().add(self.nombre())
	}
	
}