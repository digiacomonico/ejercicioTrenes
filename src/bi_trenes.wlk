/**
 * 	Está muy bien, ver abajo algunos comentarios
 */

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
	/**
	 * Está bien, también se puede resolver de la siguiente manera:
	 * method cantidadPasajeros(ancho, largo){
	 * 	if(ancho <= 2.5){
	 * 		return largo * 8
	 * 	}
	 * 	return largo * 10
	 * }
	 */
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

	// Si una formación es eficiente; es eficiente si cada una de sus 
	// locomotoras arrastra, al menos, 5 veces su peso 
	// (el de la locomotora misma).
	// Usar lista[].all para ver si son todas eficientes
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
	/** Funciona pero te complicaste:
	 *  return locomotoras.min({locomotora => locomotora.velMax()}).velMax()
	 */
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
		/**
		 * Lo mismo que en el método VelMaxF()
		 */
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

	method puntoOcho(locomotoraLibre) {
		if (!(formaciones.any({ formacion => formacion.puedeMoverse()}))) {
			if (formaciones.sum({ formacion => formacion.cuantosKgsEmpujeFaltan() }) <= locomotoraLibre.arrastreUtil()) {
				formacion.agregarLocomotora(locomotoraLibre)
					// formaciones.add({formacion => formacion.agregarLocomotora(locomotoraLibre)})
				locomotorasLibres.remove(locomotoraLibre)
			} else {
			}
		} else {
		}
	}

	/***  Posibles soluciónes, no las probé hay que testearlas!! ***/
	/**
	 *  El punto ocho habla de una formacion determinada, 
	 *  puede ser una formación que pasamos por parámetro o alguna que ya tengamos en el depósito, es a gusto del consumidor
	 *  Hay varias formas de resolverlo
	 */
	// Forma complicada
	method potenciarFormacion() {
		var formNoSeMueven = self.getFormacionesQueNoPuedenMoverse()
		if (!formNoSeMueven.isEmpty()) {
			var formacion = formNoSeMueven.anyOne() // Lo hice así para mostrar algo distinto, pero tranquilamente la formación se la podríamos pasar por parámetro
			if (self.locomotoraConArrastreIgualOMayor(formacion.cuantosKgsEmpujeFaltan())) { // Si Hay una locomotora con el arrastre necesario la agrego sino no hago nada.
				var locomotora = self.locomotoraConArrastreIgualOMayor(formacion.cuantosKgsEmpujeFaltan()).anyOne()
				formacion.agregarLocomotora(locomotora)
			}
		}
	}

	// Forma copada
	method potenciar(formacion) {
		if (self.locomotoraConArrastreIgualOMayor(formacion.cuantosKgsEmpujeFaltan()) && !formacion.puedeMoverse()) {
			var locomotora = self.locomotoraConArrastreIgualOMayor(formacion.cuantosKgsEmpujeFaltan()).anyOne()
			formacion.agregarLocomotora(locomotora)
		}
	}

	method getFormacionesQueNoPuedenMoverse() {
		return formaciones.filter({ formacion => !formacion.puedeMoverse() })
	}

	method locomotoraConArrastreIgualOMayor(valor) {
		return locomotorasLibres.any({ locomotora => locomotora.arrastreUtil() >= valor })
	}

}

