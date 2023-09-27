require_relative "Controlador_laberinto/controlador.rb"
require_relative "Modelo_laberinto/laberinto.rb"
require_relative "vista_laberinto.rb"
require_relative "vista2_laberinto.rb"

modelo = Modelo_laberinto::Laberinto.new
controlador = Controlador_laberinto::Controlador.new(modelo)
puts "¿Qué juego quieres jugar? 1 ó 2"
opcion = gets.chomp
if opcion == '1'
  vista = Vista_laberinto.new(controlador)
elsif opcion == '2'
  vista = Vista2_laberinto.new(controlador,modelo)
else
  puts "Opción no válida"
  exit
end


vista.menu_usuario()
