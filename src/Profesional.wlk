import Universidad.*

class Profesional {
	var property casaEstudios
	var property honorariosPorHora
	var property tipoProfesional
	var provinciasHabilitadas = #{}
	
	method honorariosPorHora(){
		
		return honorariosPorHora
	}
	
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
		honorariosPorHora = self.honorariosPorHora()
		return honorariosPorHora
	}
	else return honorariosPorHora
	}
	
	}
