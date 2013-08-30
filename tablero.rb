require_relative "./constantes"

class Tablero

  include Constantes

  attr_reader :tablero

  def initialize
    @tablero  = [ 
      [VALOR_VACIO, VALOR_VACIO, VALOR_VACIO], 
      [VALOR_VACIO, VALOR_VACIO, VALOR_VACIO],
      [VALOR_VACIO, VALOR_VACIO, VALOR_VACIO] 
    ]
  end

  def establecer_valor_celda(valorJugador, fila, columna)
    if tablero[fila][columna] == VALOR_VACIO
      tablero[fila][columna] = valorJugador
      return true 
    end
    return false
  end

end
