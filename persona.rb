module Herencia
class Persona
    def initialize(nombre)
        @nombre = nombre
    end

    def andar
        puts "Soy #{@nombre} y estoy andando"
    end

    def to_s
        result = "Soy una persona y mi nombre es #{@nombre}"
    end
end
end