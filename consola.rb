require_relative "./constantes"

class Consola

  include Constantes

  SEPARADOR_HORIZONTAL = "-"
  SEPARADOR_VERTICAL = "|"
  EQUIS = "X"
  CIRCULO = "O"
  VACIO = " "
  MENSAJE_INICIO = " ***** GATO RUBY *****"
  MENSAJE_TURNO = "Es el turno del jugador: "
  MENSAJE_TURNOS_FALTANTES = "Turnos faltantes de actual jugador: "
  MENSAJE_TURNOS_TOTALES = "Turnos faltantes: "
  MENSAJE_TURNO_ACTUAL = "Turno actual: "
  MENSAJE_JUEGO_ACABADO = "\nSe ha terminado el juego"
  MENSAJE_VICTORIA = "ENHORABUENA HA GANADO EL JUGADOR: "
  MENSAJE_EMPATE = "NINGUN JUGADOR HA GANADO"
  MENSAJE_ENTRADA_DATOS_JUGADOR = "\nSeleccione la celda donde desea colocar su simbolo en coordenadaas y,x|"
  MENSAJE_CELDA_UTILIZADA = "\nLa celda seleccionada ya esta utilizada. Seleccione otra celda."

  def initialize()

  end

  def iniciar_consola(tablero, turno)
    puts MENSAJE_INICIO
    imprimir_turno(VALOR_EQUIS, tablero, turno)
  end

  def imprimir_tablero(tablero)
    tamano_tablero = tablero.size
    fila = 0

    puts "\n"
    
    while fila < tamano_tablero
      columna = 0
      while columna < tamano_tablero
        imprimir_celda(tablero[fila][columna])
      
        if columna != (tamano_tablero-1)
         imprimir_separador_vertical
        end
        columna += 1
      end
      fila += 1
      imprimir_separador_horizontal(tamano_tablero) unless fila == columna
    end
  
    puts "\n"
  end

  def imprimir_celda(celda)
    case celda
    when VALOR_VACIO
      print VACIO
    when VALOR_EQUIS
      print EQUIS
    when VALOR_CIRCULO
      print CIRCULO
    end

  end

  def imprimir_separador_vertical()
    print SEPARADOR_VERTICAL
  end

  def imprimir_separador_horizontal(tamano_tablero)
    separadores = 1

    puts ""
    begin
      print SEPARADOR_HORIZONTAL
      separadores += 1
    end until separadores > ((tamano_tablero*2)-1)
    puts ""
  end

  def imprimir_turno(valorJugador, tablero, turno)
    imprimir_turno_actual(turno)
    imprimir_turnos_totales_faltantes(turno, tablero.size)
    imprimir_turno_jugador(valorJugador)
    imprimir_tablero(tablero)
  end

  def imprimir_turno_actual(turno)
    print MENSAJE_TURNO_ACTUAL
    puts "#{turno}"
  end

  def imprimir_turnos_totales_faltantes(turno_actual, tamano_tablero)
    turnos_totales = tamano_tablero*tamano_tablero
    turnos_faltantes = turnos_totales - turno_actual
    print MENSAJE_TURNOS_TOTALES
    puts "#{turnos_faltantes}"
  end

  def imprimir_turno_jugador(valorJugador)
    print MENSAJE_TURNO
    imprimir_celda(valorJugador)
    puts ""
  end

  def imprimir_empate()
    puts MENSAJE_JUEGO_ACABADO
    puts MENSAJE_EMPATE
  end

  def imprimir_victoria(jugadorGanador)
    puts MENSAJE_JUEGO_ACABADO
    print MENSAJE_VICTORIA
    imprimir_celda(jugadorGanador)
    puts ""
  end

  def leer_entrada()
    puts MENSAJE_ENTRADA_DATOS_JUGADOR
    entrada = gets.chomp
    puts "\n"
    entrada
  end

  def imprimir_celda_utilizada
    puts MENSAJE_CELDA_UTILIZADA
  end

end
