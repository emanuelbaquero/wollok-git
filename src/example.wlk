/** First Wollok example */

object jerry {
	var animal = "raton"
	var peso = 15
	method animal(){
		return animal
	}	
	method peso(){
		return peso
	}
}


object tom {
	var animal = "gato"
	var energia = 0
	method animal() {
		return animal
	}
	
	method comerRatones(){
		energia = energia+1
	}
	method energia(){
		return energia
	}
}
