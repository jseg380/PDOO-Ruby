#encoding: UTF-8
module Ejercicios
  class Parcela
      # Atributos de clase, valores por defecto
      @@NOMBRE_DEF = "Solar vacío"
      @@COMPRA_DEF = 2000
      @@EDIFICAR_DEF = @@COMPRA_DEF
      @@ALQUILER_DEF = @@COMPRA_DEF / 4

      # Sesión 2

      @@FACTORALQUILERCALLE=1.0
      @@FACTORALQUILERCASA=1.0
      @@FACTORALQUILERHOTEL=4.0

      #@FACTORALQUILERCALLE=1.0
      #@FACTORALQUILERCASA=1.0
      #@FACTORALQUILERHOTEL=4.0

      # Constructor
      # El parámetro * extra es un array que contendrá los parámetros 
      # sobrantes (si es que hay) y los ignorará, permitiendo que la función
      # se ejecute correctamente

      def initialize (nombre=@@NOMBRE_DEF, precio_compra=@@COMPRA_DEF, 
          precio_edificar=@@EDIFICAR_DEF, precio_base_alquiler=@@ALQUILER_DEF, 
          *extra)
          @nombre = nombre
          @precio_compra = precio_compra
          @precio_edificar = precio_edificar
          @precio_base_alquiler = precio_base_alquiler
          @num_casas = 0
          @num_hoteles = 0
      end

      # Consultores

      attr_reader :nombre
      attr_reader :precio_compra
      attr_reader :precio_edificar
      attr_reader :num_casas
      attr_reader :num_hoteles

      # Consultor del precio de alquiler completo

      def precio_alquiler_completo()
        # Utilizando variables de clase

        @precio_base_alquiler * (@@FACTORALQUILERCASA + @num_casas + 
                                 @num_hoteles * @@FACTORALQUILERHOTEL)

        # Utilizando variables de instancia de clase

        # @precio_base_alquiler * (Parcela.factor_alquiler_casa + @num_casas + 
        #                          @num_hoteles * Parcela.factor_alquiler_hotel)

      end

      def construir_casa()
          @num_casas += 1
          true
      end

      def construir_hotel()
          @num_hoteles += 1
          true
      end

      def to_s ()
          puts "\n\nParcela: " + @nombre.to_s + "\nPrecio de compra: " + 
              @precio_compra.to_s + "\nPrecio de edificación: " + 
              @precio_edificar.to_s + "\nPrecio de alquiler completo: " + 
              precio_alquiler_completo().to_s + "\nNúmero de casas: " + 
              @num_casas.to_s + "\nNúmero de hoteles: " + @num_hoteles.to_s
      end

      private
        def self.factor_alquiler_calle
          @FACTORALQUILERCALLE
        end
        def self.factor_alquiler_casa
          @FACTORALQUILERCASA
        end

        def self.factor_alquiler_hotel
          @FACTORALQUILERHOTEL
        end
  end

  p1 = Parcela.new("Parcela 1", 22, 424, 32)

  p1.construir_casa
  p1.construir_casa

  p2 = Parcela.new("Parcela 2", 50, 200, 10)

  p2.construir_casa
  p2.construir_hotel

  p1.to_s

  p2.to_s

end