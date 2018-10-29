import Universidad.*
import Profesional.*

class EmpresaServicio{
	
	var profesionales = #{}
	var universidades = #{}
	var property honorarioReferencia
	
	method honorarioReferencia(){
		return honorarioReferencia
	}
	
	method honorarioReferencia(honorario){
		honorarioReferencia = honorario
	}
	
	method agregarProfesional(profesional){
		profesionales.add(profesional)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	method agregarProfesionales(losProfesionales){
		profesionales.addAll(losProfesionales)
	}
	
	method profesionalesCaros(){
		var honorariosProfesionales = profesionales.filter({profesional => profesional.honorarios() > self.honorarioReferencia() })
		var honorariosUniversidades = universidades.filter({uni => uni.honorarios(profesional) > self.honorarioReferencia()})
		return honorariosProfesionales.union(honorariosUniversidades)
	}
}