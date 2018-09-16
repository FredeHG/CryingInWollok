import spells.*

object cotaDeMallas {
	method valor(duenio) = 1
}

object bendicion {
	method valor(duenio) = duenio.nivelDeHechiceria()
}

object hechizo{
	var property spell = hechizoBasico
	
	method valor(duenio) = spell.poder()
}
object ninguno{
	method valor(duenio) = 0
}
