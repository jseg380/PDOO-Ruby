module Herencia
class Corredor < Deportista

    def correr
        puts "Soy #{@nombre} y estoy corriendo."
    end

    def to_s
        result = super
        result +=  ", en específico corredor."
    end
end
end
