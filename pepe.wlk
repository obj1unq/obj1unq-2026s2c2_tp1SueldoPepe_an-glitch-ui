object pepe {
	const categoria = cadete // null
	var tipoDeBono  = nulo    //el objeto nulo


	method sueldo() = self.sueldoNeto() + 
					  self.bonoPorResultados()
					  self.bonoPorPresentismo()

	method sueldoNeto() = categoria.sueldo()

	method bonoPorResultados() = if (tipoDeBono == porcentaje){
		(self.sueldoNeto() * tipoDeBono.valor()) / 100   // multiplica el número por el porcentaje y divide el resultado entre 100
	} else{
		tipoDeBono.valor()   //idem para devolver 800 (del monto fijo) y 0 (del bono nulo)
	} 

	method tipoDeBono(_tipoDeBono){
		tipoDeBono = _tipoDeBono
	}

	method bonoPorPresentismo() = 

	method categoria(_cat) {
		categoria = _cat
	}
}

// ====================== TIPO DE BONOS POR RESULTADOS =======================
object porcentaje {
	method valor() = 10
}

object montoFijo {
	method valor() = 800
}

object nulo {
	method valor() = 0
}

// ====================== CATEGORIAS =====================
object gerente {
	method sueldo() = 15000
}

object cadete {
	method sueldo() = 20000
}



