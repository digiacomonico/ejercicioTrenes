import Universidad.*

class Profesional {
	var property casaEstudios
	var property tipoProfesional
	var provinciasHabilitadas = #{}
	var property honorarios
	
	method provHab(provincias){
		
	if (self.tipoProfesional() == "Libre" ){
		provinciasHabilitadas.addAll(provincias)
		return provinciasHabilitadas
	}
	else return provinciasHabilitadas
	}
	
	method provinciasHabilitadas(){
		return provinciasHabilitadas
	}
	
	method honorarios(){
	
	if(self.tipoProfesional() == "Libre" ){
		honorarios = self.honorarios()
		return honorarios
	}
	else return honorarios
	}
	
	}
