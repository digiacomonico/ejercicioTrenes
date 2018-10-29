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