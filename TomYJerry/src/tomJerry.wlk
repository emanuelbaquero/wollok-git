object tom{
	var animal = 'Gato';
	var energia;
	var velocidad;

	method cuantaEnergia(){
		return energia;
	}

	method queAnimal(){
		return animal;
	}
	method comerRaton(jerry){
		energia = 12 + jouleGramos.conversionGramosJoule(jerry.pesoEnGramos());
	}
	method calcularVelocidad(){
		velocidad = 5 + (energia/10);
		return (velocidad); 
	}
	method correr(metros){
		energia -= 0.5*metros;
	}

	method meConvieneComerRatonA(tom,Raton, UnaDistancia){
		return (tom.ganarEnergia(Raton,tom)>tom.consumirEnergia(UnaDistancia));
	}

	method ganarEnergia(raton,tom){
		var peso;
		peso = raton.pesoEnGramos(20);
		return tom.comerRaton(raton);
	}
	method consumirEnergia(distancia){
		var energiaConsumida;
		energiaConsumida = 0.5*distancia;
		return energiaConsumida;
	}
}

object jerry{
	var animal = 'Raton';
	var peso; 

	method queAnimal(){
		return animal;
	}
	method pesoEnGramos(peso1){
		 peso = peso1;
	}
	method pesoEnGramos(){
		return peso;
	}
}


object jouleGramos{
	var joule=0;
	var gramos=0;
	method conversionJouleGramos(joule1){
		gramos = joule1*1000
		return (gramos);
	}
	method conversionGramosJoule(gramos1){
		joule = gramos1/1000;
		return (joule);
	}
}