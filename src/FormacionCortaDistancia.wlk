import Formacion.*

class FormacionCortaDistancia inherits Formacion{
	
	const velocidadLimite = 60
	
	method velMaxFormacionCorta(){
		if(self.velMaxF() > velocidadLimite ){
			velMax = velocidadLimite
			return velMax
		}
		else {
			velMax = self.velMaxF()
			return velMax
		}
	}

	override method bienArmada(){

	if (self.puedeMoverse()){
		return !self.esCompleja()
	}

	else{
		return self.puedeMoverse()
	}
	}
	
}