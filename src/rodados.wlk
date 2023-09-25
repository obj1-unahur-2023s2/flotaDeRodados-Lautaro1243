import wollok.game.*

class Corsa {
	const capacidad = 4
	const velocidad = 150
	const peso = 1300
	var property color = null
	//var ultimaPosicion = position
	 
	method capacidad() = capacidad
	method velocidad() = velocidad
	method peso() = peso
	method pasoPor(posicion)
	method pasoPorFila(numero)
	method recorrioFilas(lista_de_numeros)
	
}


class Kwid {
	const peso = 1200
	var property tanqueAdicional = null
	const color = "azul"
	
	method capacidad(){if (not tanqueAdicional){return 4} else {return 3}}
	method velocidad(){if (not tanqueAdicional){return 120} else {return 110}}
	method peso(){if (not tanqueAdicional){return peso} else {return peso + 150}}
	method color() = color
}


object trafic {
	var property interior = null
	var property motor = null
	const peso = 4000
	const color = "blanco"
	
	method capacidad(){if (interior == "comodo"){return 5} else{return 12}}
	method peso(){if (interior == "comodo" and motor == "pulenta") {return peso + 700 + 800}
					else if(interior == "popular" and motor == "pulenta") {return peso + 1000 + 800}
					else if(interior == "comodo" and motor == "bataton") {return peso + 700 + 500}
					else{return peso + 1000 + 500}
	}
	method velocidad(){if (motor == "pulenta") return 130 else{return 80}}
}


class AutoEspecial {
	var property capacidad = null
	var property velocidad = null
	var property peso = null
	var property color = null
}


class Dependencia {
	const flota = []
	const pedidos = []
	var property empleados = 0
	
	method agregarAFlota(rodado){flota.add(rodado)}
	method quitarDeFlota(rodado){flota.remove(rodado)}
	method pesoTotalFlota() = flota.sum({rod => rod.peso()})
	method estaBienEquipada() = flota.asSet().sum() >= 3 and flota.all({rod => rod.kilometro() > 100})
	method capacidadTotalEnColor(color) = flota.filter({ rod => rod.color() == color }).sum({rod => rod.capacidad()}).max(0)
	method colorDelRodadoMasRapido() = flota.max({rod => rod.velocidad()}).color()
	method capacidadFaltante() = empleados - flota.asSet().sum({rod => rod.capacidad()})
	method esGrande() = empleados > 39 and flota.asSet().size() > 4
	method agregarPedido(pedido){pedidos.add(pedido)}
	method quitarPedido(pedido){pedidos.remove(pedido)}
	method totalPasajerosEnPedidos() = pedidos.sum({ped => ped.cantidadPasajeros()})
	method ningunoSatisface(pedido) = flota.all({auto => not pedido.puedeSatisfacerPedido(auto)})
	method pedidosNoSatisfechosPorMisAutos() = pedidos.filter({ped => not self.ningunoSatisface(ped)})
	method enTodosLosPedidosEstaComoColorIncompatible(color) = pedidos.all({ped => ped.coloresIncompatibles().contains(color)})
	method relajarTodosLosPedido(){pedidos.forEach({ped => ped.relajar()})}
}



class Pedido {
	const coloresIncompatibles = []
	var property distanciaARecorrer = null
	var property tiempoMaximo = null
	var property cantidadPasajeros = null
	
	method coloresIncompatibles() = coloresIncompatibles
	method agregarColorIncompatible(color){coloresIncompatibles.add(color)}
	method quitarColorIncompatible(color){coloresIncompatibles.remove(color)}
	method velocidadRequerida() = distanciaARecorrer/tiempoMaximo
	method puedeSatisfacerPedido(auto) = auto.velocidad() > self.velocidadRequerida() + 9 and auto.capacidad() >= self.cantidadPasajeros() and coloresIncompatibles.all({ col => col != auto.color() })
	method acelerar(){tiempoMaximo -= 1}
	method relajar(){tiempoMaximo += 1}
}
















