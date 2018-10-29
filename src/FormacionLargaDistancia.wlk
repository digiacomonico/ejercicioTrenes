import Formacion.*

class FormacionLargaDistancia inherits Formacion{
	
	var ciudadesQueUne = []
	
	method agregarCiudades(ciudad){
		ciudadesQueUne.add(ciudad)
	}
	
	method quitarCiudades(ciudad){
		ciudadesQueUne.remove(ciudad)
	}
	
	method cantidadCiudadesQueConecta(){
		return ciudadesQueUne.size()
		
	}
	
	method velMaxFormacionLarga(){
		if(self.cantidadCiudadesQueConecta() >= 2 ){
			velMax = 200
			return velMax
		}
		else {
			velMax = 150
			return velMax
		}
	}

	override method bienArmada(){
		
	if(self.puedeMoverse()){
		return vagones.sum({ vagon => vagon.cantidadBanios()}) >= vagones.sum({vagon => vagon.cantidadPasajeros()}) / 50
	}
	else{
		return self.puedeMoverse()
	}

	}
	
}