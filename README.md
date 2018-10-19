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


```
method pasajerosPuedenViajar(){
		return vagones.sum({vagon => vagon.cantidadPasajeros()})
	}
```


1) Al objeto formacion le pido la cantidad de vagones livianos. Se le pide que filtre, yendo vagon por vagon para verificar si es liviano o no. Devuelve el tamano de la cantidad de vagones livianos


```
method cantVagonesLivianos(){
		return vagones.filter({vagon => vagon.esLiviano()}).size()
	}
```


2) Al objeto formacion le pido la velocidad máxima de una formación, que es el mínimo entre las velocidades máximas de las locomotoras. En primer lugar creo la variable locomotorasByVelocidad y le asigno el resultado de ordenar la lista de locomotoras por su velocidad de menor a mayor(otra lista). Una vez que tengo la lista ordenada, le pido a la primer locomotora su velocidad maxima.
  
  
  ```
  method velMaxF(){
	var locomotorasByVelocidad = locomotoras.sortedBy({locomotoraA, locomotoraB => locomotoraA.velMax() < locomotoraB.velMax()})
	return locomotorasByVelocidad.first().velMax()
	}
  ```
  
3) Al objeto formacion le pido que devuelva si esta es eficiente. Es es eficiente si cada una de sus locomotoras arrastra, al menos, 5 veces su peso (el de la locomotora misma). Para obtener esto, le pido a la formacion que vaya locomotora por locomotora, verificando si es eficiente.


```
method locomotorasSonEficientes(){
		return locomotoras.all({locomotora => locomotora.esEficiente()})
	}
```


4) Al objeto formacion le pido que devuelva si esta puede moverse. Una formacion puede moverse si el arrastre util total de sus locomotoras es mayor o igual al peso maximo total de los vagones. Para obtener el arrastre util total de las locomotoras, le pido a la formacion que vaya locomotora por locomotora, verificando su arrastre util y sumandolo. Para obtener el peso maximo total de los vagones, le pido a la formacion que vaya vagon por vagon, independientemente si es de carga o de pasajeros, verificando su peso maximo y sumandolo. 


```
method puedeMoverse(){
		
		return locomotoras.sum({locomotora => locomotora.arrastreUtil()}) >= vagones.sum({vagon => vagon.pesoMax()})
		
	}
```


5) Al objeto formacion le pido que devuelva:
Si puede moverse: 0 (ya puede moverse, no necesita mas empuje)
Si no puede moverse, le pido que vaya vagon por vagon sumando su peso maximo, y que al resultado de esa suma, le reste la suma del arrastre util del total de las locomotoras y lo devuelva.


```
method cuantosKgsEmpujeFaltan(){
		if (self.puedeMoverse()){
			return 0
			 }
		
		else {
			return vagones.sum({vagon => vagon.pesoMax()}) - locomotoras.sum({locomotora => locomotora.arrastreUtil()})
		}	
	}
```


6) Dentro del objeto formacion creo el metodo vagonMasPesadoFormacion, y dentro de este, en primer lugar creo la variable vagonesPorPeso y le asigno el resultado de ordenar la lista de vagones por su peso maximo de mayor a menos(otra lista). Una vez que tengo la lista ordenada, le pido al primer vagon su velocidad peso maximo.
Al objeto deposito le pido que me devuelva una nueva lista, formada por los vagones mas pesados de cada formacion.


```
method vagonMasPesadoFormacion(){
		var vagonesPorPeso = vagones.sortedBy({vagonA, vagonB => vagonA.pesoMax() > vagonB.pesoMax()})
		return vagonesPorPeso.first()
	}

method vagonesMasPesados(){
	return formaciones.map({formacion => formacion.vagonMasPesadoFormacion()})
		
```

