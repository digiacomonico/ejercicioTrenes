import FormacionLargaDistancia.*

class TrenAltaVelocidad inherits FormacionLargaDistancia {
	
	var property velocidad
	
	override method bienArmada(){
		
	if(self.velMaxF() >= 250 && self.cantidadVagones() == self.cantVagonesLivianos() ){
		return true
	}
	return false	
	}
	
}