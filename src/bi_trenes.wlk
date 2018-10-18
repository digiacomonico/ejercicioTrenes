class VagonPasajeros {
	var property pesoMax
	var property cantidadPasajeros
	
	method cantidadPasajeros(ancho,largo){

		if(ancho <= 2.5){
			cantidadPasajeros = largo * 8
			return cantidadPasajeros
		}
		else {
			cantidadPasajeros = largo * 10
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
	const cantidadPasajeros = 0
	
	method pesoMax(){
		pesoMax = peso + (80*2)
		return pesoMax
	}
	
	method esLiviano(){
		return pesoMax < 2500
}
	method cantidadPasajeros(){
		return cantidadPasajeros
	}

}
class Locomotora {
	
	var property peso 
	var property pesoMax
	var property velMax 
	
	method arrastreUtil(){
		return  pesoMax - peso
		
	}
	
	//Si una formación es eficiente; es eficiente si cada una de sus 
	//locomotoras arrastra, al menos, 5 veces su peso 
	//(el de la locomotora misma).
	// Usar lista[].all para ver si son todas eficientes
	
	method esEficiente(){
		
		return self.arrastreUtil() >= (peso * 5)
		
	}
	
}

class Formacion{
	
	var vagones = []
	var locomotoras = []
	
	method agregarLocomotora(unaLocomotora){
		locomotoras.add(unaLocomotora)
	}
	
	method agregarLocomotoras(lasLocomotoras){
		locomotoras.addAll(locomotoras)
	}
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method pasajerosPuedenViajar(){
		return vagones.sum({vagon => vagon.cantidadPasajeros()})
	}

	
	method cantVagonesLivianos(){
		return vagones.filter({vagon => vagon.esLiviano()}).size()
	}
	
	method velMaxF(){
	var locomotorasByVelocidad = locomotoras.sortedBy({locomotoraA, locomotoraB => locomotoraA.velMax() < locomotoraB.velMax()})
	return locomotorasByVelocidad.first().velMax()
		
	}
	
	method locomotorasSonEficientes(){
		return locomotoras.all({locomotora => locomotora.esEficiente()})
	}
	
	method puedeMoverse(){
		
		return locomotoras.sum({locomotora => locomotora.arrastreUtil()}) >= vagones.sum({vagon => vagon.pesoMax()})
		
	}
	
	method cuantosKgsEmpujeFaltan(){
		if (self.puedeMoverse()){
			return 0
			 }
		
		else {
			return vagones.sum({vagon => vagon.pesoMax()}) - locomotoras.sum({locomotora => locomotora.arrastreUtil()})
		}	
	}
	
	
	method vagonMasPesadoFormacion(){
		var vagonesPorPeso = vagones.sortedBy({vagonA, vagonB => vagonA.pesoMax() > vagonB.pesoMax()})
		return vagonesPorPeso.first()
	}
	
	method esCompleja(){
		return vagones.size() + locomotoras.size() > 20 || vagones.sum({vagon => vagon.pesoMax()}) + locomotoras.sum({locomotora => locomotora.peso()}) > 10000
		}	
}


object deposito {
	
	var formaciones = []
	var locomotorasLibres = []
		
	method agregarFormacion(unaFormacion){
		formaciones.add(unaFormacion)
	}
	
	method agregarLocomotoraLibre(locomotora){
		locomotorasLibres.add(locomotora)
	}
	
	method vagonesMasPesados(){
	return formaciones.map({formacion => formacion.vagonMasPesadoFormacion()})
		
	}
	
	method necesitaConductorExperimentado(){
		return formaciones.any({formacion => formacion.esCompleja()})
	}
	
	method puntoOcho(locomotoraLibre){
		if(!(formaciones.any({formacion => formacion.puedeMoverse()}))){
			if(formaciones.sum({formacion => formacion.cuantosKgsEmpujeFaltan()}) <= locomotoraLibre.arrastreUtil())
			{	
				formacion.agregarLocomotora(locomotoraLibre)
				//formaciones.add({formacion => formacion.agregarLocomotora(locomotoraLibre)})
				locomotorasLibres.remove(locomotoraLibre)
			}
			else{
				
			}
			
		}
		else{
			
		}
		
	}
	

}