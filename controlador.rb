require_relative "./consola"
require_relative "./chequeador"
require_relative "./tablero"
require_relative "./constantes"

class Controlador

  include Constantes

  TURNO_INICIAL = 1
  FILA = 0
  COLUMNA = 1

    def initialize()
      @victoria = false
    end

    def jugar()
      juego = Tablero.new
      consola = Consola.new
      chequeador = Chequeador.new
      jugadorActual = VALOR_EQUIS

      turno = TURNO_INICIAL

      consola.iniciar_consola(juego.tablero, turno)

      begin
        controlar_entradas(consola, juego,jugadorActual)

        if chequeador.chequear(juego.tablero, jugadorActual)
          @victoria = true
          break
        end
        turno += 1
        jugadorActual = establecer_jugador_siguiente(turno)
        consola.imprimir_turno(jugadorActual, juego.tablero, turno)

      end until turno == juego.tablero.size*juego.tablero.size+1

    controlar_fin_juego(consola, jugadorActual)
    consola.imprimir_tablero(juego.tablero)
   end
    
    def controlar_entradas(consola, juego, valorJugador)
      begin
        entrada = consola.leer_entrada()
        valores = obtener_valor_entrada(entrada)
        if juego.establecer_valor_celda( valorJugador, valores[FILA].to_i, valores[COLUMNA].to_i )
          return
        end
          consola.imprimir_celda_utilizada
          consola.imprimir_tablero(juego.tablero)
      end while true
    end
    
    def obtener_valor_entrada(entrada)
      entrada.split(",")
    end

    def controlar_fin_juego(consola, jugadorActual)
      if @victoria
        consola.imprimir_victoria(jugadorActual)
      else
        consola.imprimir_empate()
      end
    end

    def establecer_jugador_siguiente(turno)
        if (turno % 2) == 0
          return VALOR_CIRCULO
        else
          return VALOR_EQUIS
        end
    end

end
