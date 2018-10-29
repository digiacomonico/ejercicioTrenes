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
	
	method cantidadVagones(){
		return vagones.size()
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