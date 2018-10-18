class VagonPasajeros {
	var property pesoMax
	var property cantidadPasajeros
	
	method cantidadPasajeros(largo,ancho){

		if(ancho <= 2.5){
			cantidadPasajeros = ancho * 8
			return cantidadPasajeros
		}
		else {
			cantidadPasajeros = ancho * 10
			return cantidadPasajeros
		}
	}
	
	method esLiviano(){
		return pesoMax < 2500
	}
	
	method pesoMax(){
		pesoMax = cantidadPasajeros * 80
		return pesoMax
	}
	
	
}

class VagonCarga {
	
	var property peso
	var property pesoMax
	
	method pesoMax(){
		pesoMax = peso + (80*2)
		return pesoMax
	}
	
	method esLiviano(){
		return pesoMax < 2500
}

}
class Locomotora {
	
	var property peso 
	var property pesoMax
	var property velMax 
	var arrastreUtil
	
	method arrastreUtil(){
		arrastreUtil = pesoMax - peso
		return arrastreUtil
	}
	
	//Si una formación es eficiente; es eficiente si cada una de sus 
	//locomotoras arrastra, al menos, 5 veces su peso 
	//(el de la locomotora misma).
	// Usar lista[].all para ver si son todas eficientes
	
//	method esEficiente(){
//		
//		return arrastreUtil >= (peso * 5)
//		
//	}
	
}

object deposito {
	
	var formacion = []
	
	method agregarLocomotora(unaLocomotora){
		formacion.add(unaLocomotora)
	}
	
	method agregarVagon(vagon){
		formacion.add(vagon)
	}
	
	method pasajerosPuedenViajar(){
		return formacion.sum({vagon => vagon.cantidadPasajeros()})
	}
	
	method cantVagonesLivianos(){
		return formacion.filter({vagon => vagon.esLiviano()}).size()
	}
	
	//La velocidad máxima de una formación, que es el mínimo entre las velocidades 
	//máximas de las locomotoras.
	
	method velMaxF(){
	var formacionByVelocidad = formacion.sortedBy({locomotoraA, locomotoraB => locomotoraA.velMax() < locomotoraB.velMax()})
	return formacionByVelocidad.first().velMax()
		
	}
	
	method esEficienteA(){
		return formacion.find({locomotora => locomotora.esEficiente()})
	}
	
	
	method esEficienteB(){
		var soloLocomotoras = formacion.filter({locomotora => locomotora.esEficiente()})
	}
	
	
}