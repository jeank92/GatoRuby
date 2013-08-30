require_relative "./constantes"

class Chequeador

  include Constantes

  VICTORIA = true
  CONTINUA_JUEGO = false
  JUEGO_ACABADO = true

  def initialize()
  end

  def chequear(tablero, valorJugador)
    tamano_tablero = tablero.size
    return chequear_horizontal(tablero, tamano_tablero, valorJugador) || chequear_vertical(tablero, tamano_tablero, valorJugador) || chequear_diagonales(tablero, tamano_tablero, valorJugador)
  end

  def chequear_horizontal(tablero, tamano_tablero, valorJugador)
    numero_fila = 0
    while numero_fila != tamano_tablero    
      if victoria?( tablero[numero_fila], valorJugador )
        return VICTORIA
      end
      numero_fila += 1
    end

    return CONTINUA_JUEGO
  end


  def chequear_vertical(tablero, tamano_tablero, valorJugador)
    numero_columna = 0

    while numero_columna != tamano_tablero

       if victoria?( tablero.map{|celda| celda[numero_columna]}, valorJugador )
         return VICTORIA
       end
       numero_columna += 1
      end

    return CONTINUA_JUEGO
  end

  def chequear_diagonales(tablero, tamano_tablero, valorJugador)
    return chequear_diagonal_izquierda_a_derecha(tablero, tamano_tablero, valorJugador) || chequear_diagonal_derecha_a_izquierda(tablero, tamano_tablero, valorJugador)
  end

  def chequear_diagonal_derecha_a_izquierda(tablero, tamano_tablero, valorJugador)
    diagonal = Array.new
    numero_celda = 0

    begin
      diagonal <<  tablero[numero_celda][numero_celda]
      numero_celda += 1
    end until numero_celda > tamano_tablero-1

    if victoria?(diagonal, valorJugador)
      return VICTORIA
    end
    return CONTINUA_JUEGO
  end

  def chequear_diagonal_izquierda_a_derecha(tablero, tamano_tablero, valorJugador)
    diagonal = Array.new
    numero_fila = tamano_tablero-1
    numero_columna = 0

    begin
      diagonal <<  tablero[numero_fila][numero_columna]
      numero_fila -= 1
      numero_columna += 1
    end until numero_fila < 0

    if victoria?(diagonal, valorJugador)
      return VICTORIA
    end
    return CONTINUA_JUEGO
  end

  def victoria?(arreglo, valorJugador)
    arreglo.each do |celda|
      if celda != valorJugador || celda == VALOR_VACIO
        return CONTINUA_JUEGO
      end
    end

    return VICTORIA
  end

  def tablero_lleno?(tablero)
    fila = 0
    columna = 0
    
    while fila < tablero.size-1
      columna = 0
      while columna < tablero.size-1
        if tablero[fila][columna] == VALOR_VACIO
          return CONTINUA_JUEGO
        end
        columna += 1
      end
      fila += 1
    end
    return JUEGO_ACABADO
  end

end
