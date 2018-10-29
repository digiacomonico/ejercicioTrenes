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