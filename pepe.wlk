// ============================== EMPLEADOS ==========================
object pepe {
	var categoria = cadete
	var tipoDeBonoPorResultados  = resultadosNulo    //el objeto nulo
	var faltas = 0
	var tipoDeBonoPorPresentismo = presentismoNulo


	method sueldo() = self.sueldoNeto() + self.bonoPorResultados() + self.bonoPorPresentismo()

	method sueldoNeto() = categoria.sueldo()

	method bonoPorResultados() = tipoDeBonoPorResultados.valor(self.sueldoNeto())

	method bonoPorPresentismo() = tipoDeBonoPorPresentismo.valor(faltas, self.sueldoNeto())

	method categoria(_cat){
		categoria = _cat
	}

	method faltas(_faltas){
		faltas = _faltas
	}

	method tipoDeBonoPorResultados(_tipoDeBonoPorResultados){
		tipoDeBonoPorResultados = _tipoDeBonoPorResultados
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

	method bonoPorResultados() = tipoDeBonoPorResultados.valor(self.sueldoNeto())

	method tipoDeBonoPorResultados(_tipoDeBonoPorResultados){
		tipoDeBonoPorResultados = _tipoDeBonoPorResultados
	}

	method sueldoNeto() = 28000
}

object ernesto{
	var compañero = roque
	const faltas = 0
	var tipoDeBonoPorPresentismo = presentismoNulo


	method sueldo() = self.sueldoNeto() + self.bonoPorPresentismo()

	method bonoPorPresentismo() = tipoDeBonoPorPresentismo.valor(faltas, self.sueldoNeto())

	method tipoDeBonoPorPresentismo(_tipoDeBonoPorPresentismo){
		tipoDeBonoPorPresentismo = _tipoDeBonoPorPresentismo
	}

	method sueldoNeto() = compañero.sueldoNeto()

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
	var categoriaBase = cadete


	method sueldo(){
		return categoriaBase.sueldo()/2
	}

	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
}



/*
~~ EJERCICIOS DE REFLEXIÓN Y DOCUMENTACIÓN ~~ 

Tipo de los objetos polimórficos: 
-Empleado (para los objetos pepe, moria, roque y ernesto)
-Bono por presentismo (para los objetos normal, ajuste, demagogico y nulo)
-Bono por resultados (para los objetos porcentaje, montoFijo y nulo)
-Categoria (para los objetos gerente, cadete, vendedor y medioTiempo)

Mensajes que conforman esos tipos:
-Empleado: sueldo(), sueldoNeto()
-Bono: valor()
-Categoria: sueldo()

Emisores de los mensajes polimórficos:
bonoPresentismo.valor(faltas, neto) emitido por el tipo Empleado para saber el valor del tipo de bono que tiene asignado
bonoResultados.valor(neto) emitido por el tipo Empleado para saber el valor que corresponda según el tipo que se le asigne al empleado
categoria.sueldo() emitido por el tipo Empleado para saber el sueldo que corresponda a la categoría asignada

mensaje de orden: activarAumentoPorMuchasVentas() del objecto 'vendedor'
mensaje de consulta: sueldo() de cualquier categoría, por ejemplo, del objeto 'gerente'
*/