class Destino{
	var property nombre
	var property equipajeImprescindible = new List()
	var property precio
	
	method esDestinoPeligroso(){
		return equipajeImprescindible.any {equipaje => equipaje.contains('Vacuna')}
	}
	
	method aplicarDescuento(porcentaje){
		precio -= precio * (porcentaje / 100)
		equipajeImprescindible.add('Certificado de descuento')
	}
	
}

class Empresa{
	const cantidadMinimaDestinoImportante = 2000
	var property nombre
	var property destinos = new List()
	
	method destinosMasImportantes(){
		return destinos.filter {destino => destino.precio() >= cantidadMinimaDestinoImportante}
	}
	
	method aplicarDescuento(cantDescuento, unDestino){
		var destino = self.getDestinoPorNombre(unDestino)
		destino.aplicarDescuento(cantDescuento)
	}
	
	method aplicarDescuentoDestinos(cantDescuento){
	    destinos.forEach {destino => destino.aplicarDescuento(cantDescuento)}
	}
	
	method esEmpresaExtrema(){
		var listaDestinos = self.destinosMasImportantes()
		return listaDestinos.any {destino => destino.esDestinoPeligroso()}
	}
	
	method mostrarCartaDestinos(){
		return destinos.map {destino => destino.nombre()}
	}
	
	method getDestinoPorNombre(destino){
		return destinos.find {x => x.nombre() == destino}
	}
	
}

class Usuario{
	const porcentajeKilometraje = 10
	var property empresa
	var property nombre
	var property destinosConocidos = new List()
	var property balanceEnCuenta
	var property siguiendo = new List()
	
	method puedeVolarDestino(destino){
		return balanceEnCuenta >= destino.precio()		
	}
	
	method agregarDestino(nombreDestino){
		destinosConocidos.add(nombreDestino)
	}
	
	method getKilometrosRecorridos(){
		return (self.getMontoTotalRecorrido() * porcentajeKilometraje) / 100
	}
	
	method getMontoTotalRecorrido(){
		var lista_precios = []
		destinosConocidos.forEach {nombreDestino => lista_precios.add(empresa.getDestinoPorNombre(nombreDestino).precio())}
		return lista_precios.sum()
	}
	
	method seguirUsuario(usuario){
		siguiendo.add(usuario)
		usuario.siguiendo().add(self)
	}
	
	method volarDestino(nombreDestino){
		var destino = empresa.getDestinoPorNombre(nombreDestino)
		if (self.puedeVolarDestino(destino)){
			balanceEnCuenta -= destino.precio()
			self.agregarDestino(nombreDestino)
		}
	}
	
	method siguiendo(){
		// en lugar de retornar la lista entera, retorno los nombres para que sea un print mas amigable
		// posiblemente haya que cambiarlo en una instancia futura
		return siguiendo.map {seguidor => seguidor.nombre()}
	}

}


object testDataGenerator{
	//no tengo la mas palida idea de si esto seria una buena idea pero pinto totalmente
	
	method setUpDestino(destino, nombre, equipaje, precio){
		destino.nombre(nombre)
		destino.equipajeImprescindible(equipaje)
		destino.precio(precio)
	}
	
	method setUpUsuario(usuario, nombre, empresa, destinosConocidos, balanceEnCuenta){
		usuario.nombre(nombre)
		usuario.empresa(empresa)
		usuario.destinosConocidos(destinosConocidos)
		usuario.balanceEnCuenta(balanceEnCuenta)
	}
	
	method setUpEmpresa(empresa, nombre, listaDestinos){
		empresa.nombre(nombre)
		empresa.destinos(listaDestinos)
	}
	
	method genGarlicSea(){
		const garlicSea = new Destino()
		const nombre = "Garlic's Sea"
		const equipajeImprescindible = ["Caña de Pescar", "Piloto"]
		const precio = 2500
		self.setUpDestino(garlicSea, nombre, equipajeImprescindible, precio)
		return garlicSea
	}
	
	method genSilverSea(){
		const silverSea = new Destino()
		const nombre = "Silver's Sea"
		const equipajeImprescindible = ["Protector Solar", "Equipo de Buceo"]
		const precio = 1350
		self.setUpDestino(silverSea, nombre, equipajeImprescindible, precio)
		return silverSea
	}
	
	method genLastToninas(){
		const lastToninas = new Destino()
		const nombre = "Last Toninas"
		const equipajeImprescindible = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
		const precio = 3500
		self.setUpDestino(lastToninas, nombre, equipajeImprescindible, precio)
		return lastToninas
	}
	
	method genGoodAirs(){
		const goodAirs = new Destino()
		const nombre = "Good Airs"
		const equipajeImprescindible = ["Cerveza", "Protector Solar"]
		const precio = 1500
		self.setUpDestino(goodAirs, nombre, equipajeImprescindible, precio)
		return goodAirs
	}
	
	method genBarrileteCosmico(){
		const barrileteCosmico = new Empresa()
		const nombre = "Barrilete Cosmico"
		const garlicSea = self.genGarlicSea()
		const silverSea = self.genSilverSea()
		const lastToninas = self.genLastToninas()
		const goodAirs = self.genGoodAirs()
		const listaDestinos = [garlicSea, silverSea, lastToninas, goodAirs]
		self.setUpEmpresa(barrileteCosmico, nombre, listaDestinos)
		return barrileteCosmico
	}
	
	method genPHari(){
		const pHari = new Usuario()
		const nombre = "Pablo Hari"
		const empresa = self.genBarrileteCosmico()
		const destinosConocidos = ["Last Toninas", "Good Airs"]
		const balanceEnCuenta = 1500
		self.setUpUsuario(pHari, nombre, empresa, destinosConocidos, balanceEnCuenta)
		return pHari
	}
	
	
}


