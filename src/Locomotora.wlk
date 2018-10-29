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