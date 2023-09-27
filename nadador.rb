module Herencia
class Nadador < Deportista

    def nadar
        puts "Soy #{@nombre} y estoy nadando."
    end

    def to_s
        result = super
        result += ", en específico nadador."
    end
end
end