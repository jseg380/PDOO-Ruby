require_relative "persona.rb"
require_relative "deportista.rb"
require_relative "corredor.rb"
require_relative "nadador.rb"


persona = Herencia::Persona.new("Pedro")
puts persona.to_s

deportista = Herencia::Deportista.new("Pedrillo", 782)
puts deportista.to_s

nadador = Herencia::Nadador.new("Pedrón", 823)
puts nadador.to_s

corredor = Herencia::Corredor.new("Pedrosa", 54)
puts corredor.to_s


persona.andar
deportista.andar
nadador.andar
corredor.andar

deportista.competicion_deportiva
nadador.competicion_deportiva
corredor.competicion_deportiva

# NO SE PUEDE deportista.nadar o correr (métodos de los hijos)
nadador.nadar
# NO SE PUEDE nadar.correr (métodos de una clase diferente que no es padre)
corredor.correr