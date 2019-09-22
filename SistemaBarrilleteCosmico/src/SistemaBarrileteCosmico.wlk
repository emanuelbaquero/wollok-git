object garlic{
	var idDestino;
	var nombre;
	var equipaje = [];
	var precio;
	
	method getNombre()
	{
		return nombre;
	}
	method setNombre(p_nombre)
	{
		nombre = p_nombre;
	}
	method getEquipaje()
	{
		return equipaje;
	}
	method setEquipaje(p_equipaje)
	{
		equipaje.add(p_equipaje);
	}
	method getPrecio()
	{
		return precio;
	}
	method setPrecio(p_precio)
	{
		precio = p_precio;
	}
	method obtenerPrecio()
	{
		return precio;
	}
	method cargarDatos()
	{
		idDestino = 1;
		nombre = "Garlic´s Sea";
		equipaje.add('Caña de Pescar');
		equipaje.add('Piloto');
		precio = 2500;
	}
	
}


///////////////////////////////////////////////////////////////////////


object silver{
	var idDestino;
	var nombre;
	var equipaje = [];
	var precio;
	
	method getNombre()
	{
		return nombre;
	}
	method setNombre(p_nombre)
	{
		nombre = p_nombre;
	}
	method getEquipaje()
	{
		return equipaje;
	}
	method setEquipaje(p_equipaje)
	{
		equipaje.add(p_equipaje);
	}
	method getPrecio()
	{
		return precio;
	}
	method setPrecio(p_precio)
	{
		precio = p_precio;
	}
	method obtenerPrecio()
	{
		return precio;
	}

		method cargarDatos()
	{
		idDestino = 2;
		nombre = "Silver's Sea";
		equipaje.add('Protector Solar');
		equipaje.add('Equipo de Buceo');
		precio = 1350;
	}
	
}


///////////////////////////////////////////////////////////////////////


object last{
	var idDestino;
	var nombre;
	var equipaje = [];
	var precio;
	
	method getNombre()
	{
		return nombre;
	}
	method setNombre(p_nombre)
	{
		nombre = p_nombre;
	}
	method getEquipaje()
	{
		return equipaje;
	}
	method setEquipaje(p_equipaje)
	{
		equipaje.add(p_equipaje);
	}
	method getPrecio()
	{
		return precio;
	}
	method setPrecio(p_precio)
	{
		precio = p_precio;
	}
		method obtenerPrecio()
	{
		return precio;
	}

		method cargarDatos()
	{
		idDestino = 3;
		nombre = "Last Toninas";
		equipaje.add('Vacuna Gripa');
		equipaje.add('Vacuna B');
		equipaje.add('Necronomicon');
		precio = 3500;
	}
	
}

///////////////////////////////////////////////////////////////////////

object good{
	var idDestino;
	var nombre;
	var equipaje = [];
	var precio;
	
	method getNombre()
	{
		return nombre;
	}
	method setNombre(p_nombre)
	{
		nombre = p_nombre;
	}
	method getEquipaje()
	{
		return equipaje;
	}
	method setEquipaje(p_equipaje)
	{
		equipaje.add(p_equipaje);
	}
	method getPrecio()
	{
		return precio;
	}
	method setPrecio(p_precio)
	{
		precio = p_precio;
	}
	method obtenerPrecio()
	{
		return precio;
	}

		method cargarDatos()
	{
		idDestino = 4;
		nombre = "Good Airs";
		equipaje.add('Cerveza');
		equipaje.add('Protector Solar');
		precio = 1500;
	}
	
}


object pablo{
	var idUsuario;
	var nombre;
	var historialViajes = [];
	var totalCuenta;
	var seguidos = [];
	var promedioKm;
	
	method getNombre()
	{
		return nombre;
	}
	method setNombre(p_nombre)
	{
		nombre = p_nombre;
	}
	method getHistorialViajes()
	{
		return historialViajes;
	}
	method setHistorialViajes(p_destino)
	{
		historialViajes.add(p_destino);
	}
	method getTotalCuenta()
	{
		return totalCuenta;
	}
	method setTotalCuenta(p_total)
	{
		totalCuenta = p_total;
	}
	method obtenerTotalCuenta()
	{
		return totalCuenta;
	}
	method getSeguidos()
	{
		return seguidos;
	}
	method setSeguidos(p_seguir)
	{
		seguidos.add(p_seguir);
	}
	method puedePagar(p_destino)
	{
		return (totalCuenta > p_destino.obtenerPrecio());
	}
	method volar(p_destino) 
	{
		totalCuenta = totalCuenta - (p_destino.obtenerPrecio());
		self.setHistorialViajes(p_destino);
	}
	
	
	method cargarDatos()
	{
		idUsuario = 1;
		nombre = "PHari";
		historialViajes.add(last);
		historialViajes.add(good);
		totalCuenta = 1500;
	}
	method obtenerPromedioKm()
	{
		promedioKm = 0;
		promedioKm = (historialViajes.sum({precios => precios.obtenerPrecio()}))*0.1;
		return promedioKm;
	}
	method seguir(p_usuario)
	{
		seguidos.add(p_usuario);
		p_usuario.getHistorialViajes();
	}

	
}

object sistema
{	
	var list_destinos  = [];
	var list_usuarios = [];
	
	method cargarDestinos()
	{
		list_destinos.add(garlic);
		list_destinos.add(silver);
		list_destinos.add(last);
		list_destinos.add(good);
	}
	
	method cargarUsuarios()
	{
		list_usuarios.add(pablo);
	}
	

}