// ============================== EMPLEADOS ==========================
object pepe {
	var categoria = cadete
	var tipoDeBonoPorResultados  = resultadosNulo    //el objeto nulo
	var faltas = 0
	var tipoDeBonoPorPresentismo = presentismoNulo


	method sueldo() = self.sueldoNeto() + 
					  self.bonoPorResultados() + 
					  self.bonoPorPresentismo()

	method sueldoNeto() = categoria.sueldo()

	method bonoPorResultados() = tipoDeBonoPorResultados.valor(self.sueldoNeto())

	method tipoDeBonoPorResultados(_tipoDeBonoPorResultados){
		tipoDeBonoPorResultados = _tipoDeBonoPorResultados
	}

	method bonoPorPresentismo() = tipoDeBonoPorPresentismo.valor(faltas, self.sueldoNeto())

	method categoria(_cat){
		categoria = _cat
	}

	method faltas(_faltas){
		faltas = _faltas
	}

	method tipoDeBonoPorPresentismo(_tipoDeBonoPorPresentismo) {
	    tipoDeBonoPorPresentismo = _tipoDeBonoPorPresentismo
	}
}

object moria {
	var categoria = cadete
	var tipoDeBonoPorResultados = resultadosNulo


	method sueldo() = self.sueldoNeto() + self.bonoPorResultados()

	method sueldoNeto() = categoria.sueldo() * 1.3

	method bonoPorResultados() = tipoDeBonoPorResultados.valor(self.sueldoNeto())

	method categoria(_cat){
		categoria = _cat
	}

	method tipoDeBonoPorResultados(_tipoDeBonoPorResultados){
		tipoDeBonoPorResultados = _tipoDeBonoPorResultados
	}
}

object roque{
	var tipoDeBonoPorResultados = resultadosNulo


	method sueldo() = self.sueldoNeto() + self.bonoPorResultados() + 9000

	method bonoPorResultados() = tipoDeBonoPorResultados

	method tipoDeBonoPorResultados(_tipoDeBonoPorResultados){
		tipoDeBonoPorResultados = _tipoDeBonoPorResultados
	}

	method sueldoNeto() = 28000
}

object ernesto{
	var compañero = roque
	const faltas = 0
	var tipoDeBonoPorPresentismo = presentismoNulo


	method sueldo() = self.sueldoNeto() + self.tipoDeBonoPorPresentismo()

	method bonoPorPresentismo() = tipoDeBonoPorPresentismo.valor(faltas, self.sueldoNeto())

	method sueldoNeto() = compañero.sueldo()

	method compañero(_compañero){
		compañero = _compañero
	}
}

// ====================== TIPO DE BONOS POR RESULTADOS =======================
object resultadosPorcentaje {
	var porcentaje = 10

	method valor(neto) = neto * porcentaje / 100
	method porcentaje(_porcentaje){
		porcentaje = _porcentaje
	}
}

object resultadosMontoFijo {
	method valor(neto) = 800
}

object resultadosNulo {
	method valor(neto) = 0
}

// ======================= TIPO DE BONOS POR PRESENTISMO ===========================
object presentismoNormal {
	method valor(cantFaltas, neto) = if (cantFaltas == 0){
		2000
	} else if (cantFaltas == 1){
		1000
	} else{
		0
	}
}

object presentismoAjuste {
	method valor(cantFaltas, neto) = if (cantFaltas == 0){
		100
	} else {
		0
	}
}

object presentismoDemagogico {
	method valor(cantFaltas, neto) = if (neto < 18000){
		500
	} else{
		300
	}
}

object presentismoNulo {
	method valor(cantFaltas, neto) = 0
}

// ====================== CATEGORIAS =====================
object gerente {
	method sueldo() = 15000
}

object cadete {
	method sueldo() = 20000
}

object vendedor {
	var mogollonDeVentas = false


	method sueldo() = if (mogollonDeVentas){
		16000 * 1.25
	} else{
		16000
	}

	method activarAumentoPorMuchasVentas() {
		mogollonDeVentas = true
	}

	method desactivarAumentoPorMuchasVentas(){
		mogollonDeVentas = false
	}
}

object medioTiempo {
	method categoriaBase(categoria){
		return categoria.sueldo()/2
	}
}

