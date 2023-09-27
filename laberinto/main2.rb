require_relative "Controlador_laberinto/controlador.rb"
require_relative "Modelo_laberinto/laberinto.rb"
require_relative "vista2_laberinto.rb"

modelo = Modelo_laberinto::Laberinto.new
controlador = Controlador_laberinto::Controlador.new(modelo)
vista = Vista2_laberinto.new(controlador,modelo)


vista.menu_usuario()
