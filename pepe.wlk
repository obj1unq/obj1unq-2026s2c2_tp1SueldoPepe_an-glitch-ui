object pepe {
	var categoria = cadete
	var tipoDeBono  = nulo    //el objeto nulo
	var faltas = 0


	method sueldo() = self.sueldoNeto() + 
					  self.bonoPorResultados() + 
					  self.bonoPorPresentismo()

	method sueldoNeto() = categoria.sueldo()

	method bonoPorResultados() = tipoDeBono.valor(self.sueldoNeto())

	method tipoDeBono(_tipoDeBono){
		tipoDeBono = _tipoDeBono
	}

	method bonoPorPresentismo() = 0

	method categoria(_cat){
		categoria = _cat
	}

	method faltas(_faltas){
		faltas = _faltas
	}
}

// ====================== TIPO DE BONOS POR RESULTADOS =======================
object porcentaje {
	var porcentaje = 10

	method valor(neto) = neto * porcentaje / 100
	method porcentaje(_porcentaje){
		porcentaje = _porcentaje
	}
}

object montoFijo {
	method valor(neto) = 800
}

object nulo {
	method valor(neto) = 0
}

// ====================== CATEGORIAS =====================
object gerente {
	method sueldo() = 15000
}

object cadete {
	method sueldo() = 20000
}



