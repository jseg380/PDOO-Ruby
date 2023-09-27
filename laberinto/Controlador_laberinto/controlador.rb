module Controlador_laberinto

  require_relative './../Modelo_laberinto/habitacion.rb'
  require_relative './../Modelo_laberinto/laberinto.rb'
  require_relative 'estado_juego.rb'

class Controlador
  attr_reader :estado, :vidas, :habitacion_usuario

  def initialize (modelo)
    @vidas = 0
    @habitacion_usuario = Modelo_laberinto::Habitacion.new(0)
    @modelo = modelo
    @estado = Estado_juego::EN_ENTRADA_LABERINTO
  end

  def entrar (vidas)
    @vidas = vidas
    @habitacion_usuario = @modelo.puerta_entrada.habitacion_al_otro_lado(@habitacion_usuario)
    @habitacion_usuario.set_lado(Modelo_laberinto::Direccion::SUR,
                                 Modelo_laberinto::Elemento_separador.nueva_pared(@habitacion_usuario, nil))
    @estado = Estado_juego::DENTRO_VIVO
  end

  def intentar_avanzar()

    movimiento = rand(4)

    if( @habitacion_usuario.pasar(movimiento) )
      
      if (movimiento != 3)
        @habitacion_usuario = @modelo.habitaciones[@habitacion_usuario.num_habitacion]
      else
        @habitacion_usuario = @modelo.habitaciones[@habitacion_usuario.num_habitacion-2]
      end

      if ( @habitacion_usuario == nil )
        @estado = Estado_juego::EN_SALIDA_LABERINTO
      end

    else
      @vidas = @vidas - 1

      if ( @vidas == 0 )
        @estado = Estado_juego::DENTRO_MUERTO
      end

    end

    movimiento # devolvemos el movimiento
  end

end

end
