import Universidad.*
import EmpresaServicio.*

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
	
	method honorarios(universidad,profesional){
	
	if(self.tipoProfesional() == "Libre" ){
		honorarios = self.honorarios()
		return honorarios
	}
	else if (self.tipoProfesional() == "Vinculado"){
		honorarios = universidad.honorarios(profesional)
		return honorarios
		
	}
	else if (self.tipoProfesional() == "Litoral"){
		honorarios =  universidad.honorarios(profesional)
		return honorarios
	}
	else return honorarios
	}
	}
