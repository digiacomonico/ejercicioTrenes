class VagonPasajeros {

	var property pesoMax
	var property cantidadPasajeros

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

	method agregarLocomotora(unaLocomotora) {
		locomotoras.add(unaLocomotora)
	}

	method agregarLocomotoras(lasLocomotoras) {
		locomotoras.addAll(locomotoras)
	}

	method agregarVagon(vagon) {
		vagones.add(vagon)
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
		/**
		 *  Se puede llevar a otros método para que no quede tan largo y sea dificil de leer
		 *  return tamanioTotal() > 20 || pesoTota() > 10000
		 */
		return vagones.size() + locomotoras.size() > 20 || vagones.sum({ vagon => vagon.pesoMax() }) + locomotoras.sum({ locomotora => locomotora.peso() }) > 10000
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

