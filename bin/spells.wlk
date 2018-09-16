object espectroMalefico {
	var property nombre = "espectro Malefico"
	method poder() = nombre.size()
	
	method esPoderoso() = self.poder() > 15
}

object hechizoBasico {
	var property nombre = "hechizoBasico"
	method poder() = 10
	
	method esPoderoso() = self.poder() > 15
}

object libroDeHechizos{
	var property hechizos = #{}
	
	method poder() = hechizos.sum({hechizo => hechizo.poder()})
	
	method esPoderoso() = self.poder() > 15
}