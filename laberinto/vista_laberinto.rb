# encoding:utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

  require_relative './Controlador_laberinto/estado_juego.rb'
  require_relative './Controlador_laberinto/controlador.rb'
  require_relative './Modelo_laberinto/direccion.rb'

class Vista_laberinto

  def initialize(controlador)
    @controlador = controlador
  end

  def menu_usuario
    case @controlador.estado
    when Controlador_laberinto::Estado_juego::EN_ENTRADA_LABERINTO

      puts "Introduzca el número de vidas (entre 1 y 10) antes de entrar en el laberinto"
      vidas=gets.chomp.to_i

      while (vidas < 1 || vidas > 10)
        puts "Introduzca el número de vidas (entre 1 y 10) antes de entrar en el laberinto"
        vidas=gets.chomp.to_i
      end
      @controlador.entrar(vidas)

    when Controlador_laberinto::Estado_juego::DENTRO_VIVO

      informe_dentro(@controlador.habitacion_usuario, @controlador.vidas)

      puts "Pulse enter para continuar"
      st= gets.chomp

      vidas_antes = @controlador.vidas

      movimiento = @controlador.intentar_avanzar
      
      direccion = Modelo_laberinto::Lista_direcciones[movimiento]

      if vidas_antes == @controlador.vidas
        puts "Se ha avanzado hacia " + direccion
      else
        puts "Se ha intentado avanzar hacia " + direccion
      end

    when Controlador_laberinto::Estado_juego::EN_SALIDA_LABERINTO

      puts "Has conseguido salir del laberinto\n"
      informe_final (@controlador.vidas)
      exit 0

    when Controlador_laberinto::Estado_juego::DENTRO_MUERTO

      puts "Has muerto en el laberinto\n"
      informe_final (@controlador.vidas)
      exit 0

    end

    menu_usuario
  end

  def informe_dentro (habitacion, vidas)
    puts ("habitacion: " + habitacion.num_habitacion.to_s + " . Vidas: " + vidas.to_s)
  end

  def informe_final (vidas)
    puts "Te quedan " + vidas.to_s + " vidas\n"
  end

end
