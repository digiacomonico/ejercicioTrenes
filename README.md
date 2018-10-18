# ejercicioTrenes


Indicar qué clases se necesitan, qué variables de instancia se necesitan en cada clase, qué mensajes van a entender las instancias de cada clase, y escribir los métodos correspondientes.

Clases:

VagonPasajeros

VagonCarga

Locomotora

Formacion

Objeto:

Deposito

Variables de instancia que se necesitan en cada clase:

VagonPasajeros:

pesoMax

cantidadPasajeros

VagonCarga:

pesoMax

peso

cantidadPasajeros

Locomotora:

pesoMax

peso

velMax

Formacion:

vagones

locomotoras

Deposito:

formaciones

locomotorasLibres

Metodos:

VagonPasajeros:

cantidadPasajeros()

esLiviano()

pesoMax()

VagonCarga:

esLiviano()

pesoMax()

cantidadPasajeros()

Locomotora:

arrastreUtil()

esEficiente()

Formacion:

agregarLocomotora()

agregarLocomotoras()

agregarVagon()

pasajerosPuedenViajar()

cantVagonesLivianos()

velMaxF()

locomotorasSonEficientes()

puedeMoverse()

cuantosKgsEmpujeFaltan()

vagonMasPesadoFormacion()

esCompleja()

Deposito:

agregarFormacion()

agregarLocomotoraLibre()

vagonesMasPesados()

necesitaConductorExperimentado()

puntoOcho()


Para cada punto, indicar a qué objeto se le pide lo que se indica, con qué mensaje, qué parámetros, y qué devuelve.

0) Al objeto formacion le pido la cantidad de pasajeros que pueden viajar. Se le pide que sume la cantidad de pasajeros que contiene cada vagon, utilizando el metodo cantidadPasajeros(), y devuelve la cantidad de pasajeros totales para esa formacion

method pasajerosPuedenViajar(){
		return vagones.sum({vagon => vagon.cantidadPasajeros()})
	}
  
1) Al objeto formacion le pido la cantidad de vagones livianos. Se le pide que filtre, yendo vagon por vagon para verificar si es liviano o no. Devuelve el tamano de la cantidad de vagones livianos

method cantVagonesLivianos(){
		return vagones.filter({vagon => vagon.esLiviano()}).size()
	}
  
2) Al objeto formacion le pido la velocidad máxima de una formación, que es el mínimo entre las velocidades máximas de las locomotoras. En primer lugar creo la variable locomotorasByVelocidad y le asigno el resultado de ordenar la lista de locomotoras por su velocidad de menor a mayor(otra lista). Una vez que tengo la lista ordenada, le pido a la primer locomotora su velocidad maxima.
  
  method velMaxF(){
	var locomotorasByVelocidad = locomotoras.sortedBy({locomotoraA, locomotoraB => locomotoraA.velMax() < locomotoraB.velMax()})
	return locomotorasByVelocidad.first().velMax()
	}
  
3) Al objeto formacion le pido que devuelva si esta es eficiente. Es es eficiente si cada una de sus locomotoras arrastra, al menos, 5 veces su peso (el de la locomotora misma). Para obtener esto, le pido a la formacion que vaya locomotora por locomotora, verificando si es eficiente.

method locomotorasSonEficientes(){
		return locomotoras.all({locomotora => locomotora.esEficiente()})
	}
