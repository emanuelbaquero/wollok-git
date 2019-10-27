class Jerry {
	method irAventura(rick){
	} 
}

class Beth {
	var property amorPadre = 0

	method irAventura(rick){
			rick.disminuirDemencia()
			self.aumentarAmorPadre()	
	} 
	
	method aumentarAmorPadre(){
		amorPadre = amorPadre + 10
	}

}

class Summer {
	var property amorPadre = 0

	method irAventuraElMiercoles(rick){
		if (rick.fecha_dia() == "miecoles"){ 
			self.irAventura(rick)
		}
		else{

		}
	}
	
	
	method irAventura(rick){
			rick.disminuirDemencia()
			self.aumentarAmorPadre()	
	} 
	
	
	method aumentarAmorPadre(){
		amorPadre = amorPadre + 10
	}
}

class Morty {
	var property saludMental = 0
	
	method irAventura(rick){//DISMINUIR -30 SALUD MENTAL
		rick.aumentarDemencia()
		self.reducirSaludMental()
		
	}
	method reducirSaludMental(){
		saludMental = saludMental -  30	
	}
	
	
}

class Rick {
	var property nivelDemencia = 0
	var property fecha_dia = "miercoles"
	var property morty = new Morty()
	var property beth = new Beth()
	var property summer = new Summer()
	var property jerry = new Jerry()
		
	method disminuirDemencia(){
		nivelDemencia = nivelDemencia - 20
	}
	
	method aumentarDemencia(){
		nivelDemencia = nivelDemencia + 50
	}
}



class UniversosParalelos{
	var property universos = []
	var property ricks

	method otroUniversoParalelo(){
			ricks = new Rick()
			universos.add(ricks)
	}
}

