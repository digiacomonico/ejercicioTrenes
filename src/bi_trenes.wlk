class VagonPasajeros {

	var property pesoMax
	var property cantidadPasajeros
	var property cantidadBanios = 0

	method cantidadPasajeros(ancho, largo) {
		if (ancho <= 2.5) {
			cantidadPasajeros = largo * 8
			return cantidadPasajeros
		} else {
			cantidadPasajeros = largo * 10
			return cantidadPasajeros
		}
	}

	method esLiviano() {
		return pesoMax < 2500
	}

	method pesoMax() {
		pesoMax = cantidadPasajeros * 80
		return pesoMax
	}


}

class VagonCarga {

	var property peso
	var property pesoMax
	const cantidadPasajeros = 0
	const cantidadBanios = 0

	method pesoMax() {
		pesoMax = peso + (80 * 2)
		return pesoMax
	}

	method esLiviano() {
		return pesoMax < 2500
	}

	method cantidadPasajeros() {
		return cantidadPasajeros
	}

}

class Locomotora {

	var property peso
	var property pesoMax
	var property velMax

	method arrastreUtil() {
		return pesoMax - peso
	}


	method esEficiente() {
		return self.arrastreUtil() >= (peso * 5)
	}

}

class Formacion {

	var vagones = []
	var locomotoras = []
	var velMax 

	method agregarLocomotora(unaLocomotora) {
		locomotoras.add(unaLocomotora)
	}

	method agregarLocomotoras(lasLocomotoras) {
		locomotoras.addAll(locomotoras)
	}

	method agregarVagon(vagon) {
		vagones.add(vagon)
	}

	method bienArmada(){
		return self.puedeMoverse()
	}


	method pasajerosPuedenViajar() {
		return vagones.sum({ vagon => vagon.cantidadPasajeros() })
	}

	method cantVagonesLivianos() {
		return vagones.filter({ vagon => vagon.esLiviano() }).size()
	}

	method velMaxF() {
		var locomotorasByVelocidad = locomotoras.sortedBy({ locomotoraA , locomotoraB => locomotoraA.velMax() < locomotoraB.velMax() })
		return locomotorasByVelocidad.first().velMax()
	}

	method locomotorasSonEficientes() {
		return locomotoras.all({ locomotora => locomotora.esEficiente() })
	}

	method puedeMoverse() {
		return locomotoras.sum({ locomotora => locomotora.arrastreUtil() }) >= vagones.sum({ vagon => vagon.pesoMax() })
	}

	method cuantosKgsEmpujeFaltan() {
		if (self.puedeMoverse()) {
			return 0
		} else {
			return vagones.sum({ vagon => vagon.pesoMax() }) - locomotoras.sum({ locomotora => locomotora.arrastreUtil() })
		}
	}

	method vagonMasPesadoFormacion() {
		var vagonesPorPeso = vagones.sortedBy({ vagonA , vagonB => vagonA.pesoMax() > vagonB.pesoMax() })
		return vagonesPorPeso.first()
	}

	method esCompleja() {
		return self.tamanioTotal() > 20 || self.pesoTotal() > 10000
	}


	method tamanioTotal(){
		return vagones.size() + locomotoras.size()
	}

	method pesoTotal(){
		return vagones.sum({ vagon => vagon.pesoMax() }) + locomotoras.sum({ locomotora => locomotora.peso() })
	}

}

class FormacionLargaDistancia inherits Formacion{

	override method bienArmada(){
		
	if(self.puedeMoverse()){
		return vagones.sum({ vagon => vagon.cantidadBanios()}) >= vagones.sum({vagon => vagon.cantidadPasajeros()}) / 50
	}
	else{
		return self.puedeMoverse()
	}

	}
	
}

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

object deposito {

	var formaciones = []
	var locomotorasLibres = []

	method agregarFormacion(unaFormacion) {
		formaciones.add(unaFormacion)
	}

	method agregarLocomotoraLibre(locomotora) {
		locomotorasLibres.add(locomotora)
	}

	method vagonesMasPesados() {
		return formaciones.map({ formacion => formacion.vagonMasPesadoFormacion() })
	}

	method necesitaConductorExperimentado() {
		return formaciones.any({ formacion => formacion.esCompleja() })
	}


	method potenciar(formacion) {
		if (self.haylocomotorasConArrastreIgualOMayor(formacion.cuantosKgsEmpujeFaltan()) && !formacion.puedeMoverse()) {
			var locomotora = self.locomotoraLibreHabilitada(formacion.cuantosKgsEmpujeFaltan())
			formacion.agregarLocomotora(locomotora)
		}
	}

	method getFormacionesQueNoPuedenMoverse() {
		return formaciones.filter({ formacion => !formacion.puedeMoverse() })
	}

	method haylocomotorasConArrastreIgualOMayor(valor) {
		return locomotorasLibres.any({ locomotora => locomotora.arrastreUtil() >= valor })
}


	method locomotoraLibreHabilitada(valor){
		return locomotorasLibres.filter({locomotora => locomotora.arrastreUtil() >= valor}).first()
		
	}
}

