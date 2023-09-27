module Herencia
class Deportista < Persona
    def initialize(nombre,horas_entrenamiento)
        super(nombre)
        @horas_entrenamiento = horas_entrenamiento
    end

    def competicion_deportiva
        puts "Soy #{@nombre} y estoy compitiendo."
    end

    def to_s
        result = super
        result += " y soy deportista y entreno #{@horas_entrenamiento} horas"
    end
end
end