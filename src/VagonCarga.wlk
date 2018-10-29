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