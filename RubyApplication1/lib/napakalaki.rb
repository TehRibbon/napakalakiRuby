# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

require "singleton"

require_relative "card_dealer"
require_relative "monster"
require_relative "player"

  class Napakalaki
    #Patrón Singleton
    include Singleton
    #Atributos
    attr_accessor :currentMonster, :dealer, :players, :currentPlayer
    #Constructor
    def initialize

    end

    #Metodos

    #Inicializa el array de jugadores que contiene Napakalaki, creando tantos jugadores como
    #elementos haya en names, que es el array de String que contiene el nombre de los
    #jugadores.
    def initPlayers(names)
      @players = Array.new

      #creamos tantos jugadores como nombres 
      names.each do |nombre_jugador|
        players << Player.new(nombre_jugador)
      end
    end

    #Decide qué jugador es el siguiente en jugar.
    #En primer lugar, se calcula el índice que ocupa el siguiente jugador en la lista de jugadores.
    #Se pueden dar dos posibilidades:
    #◦ Que sea la primera jugada, en este caso hay que generar un número aleatorio entre 0 y
    #el número de jugadores menos 1. Este número indicará el índice que ocupa en la lista
    #de jugadores el jugador que comenzará la partida.
    #◦ Que no sea la primera jugada, en este caso el índice es el del jugador que se encuentra
    #en la posición siguiente respecto al jugador actual. Hay que tener en cuenta que si el
    #jugador actual está en la última posición de la lista, el siguiente será el que está en la
    #primera posición.
    #Una vez calculado el índice, se devuelve el jugador que ocupa esa posición.
    def nextPlayer


      #indice_siguiente
      total_jugadores = @players.length

      if(@players = nil) then
        indice_siguiente = rand(total_jugadores)
      else
        indice_jugador_actual = @players.index(@currentPlayer)
        if(indice_jugador_actual == total_jugadores) then
          indice_siguiente= 0
        else 
          indice_siguiente = indice_jugador_actual + 1
        end
      end

      nextPlayer = @players.at(indice_siguiente)
      @currentPlayer = nextPlayer

      return @currentPlayer
    end

      #Método que comprueba si el jugador activo (currentPlayer) cumple con las reglas del juego
      #para poder terminar su turno. Devuelve false si el jugador activo no puede pasar de turno y
      #true en caso contrario, para ello usa el método de Player validState() donde se realizan las
      #comprobaciones pertinentes.
    def nextTurnIsAllowed
      return @currentPlayer.validState()
    end

    #Se asigna un enemigo a cada jugador. Esta asignación se hace de forma aleatoria teniendo
    #en cuenta que un jugador no puede ser enemigo de sí mismo.
    def setEnemies
      posAleatoria = @players.rand(@players.length)
      @players.each do |enemigo|
        while(enemigo != enemigo.getEnemy())
          enemigo.setEnemy(@players.at(posAleatoria))
        end
      end
    end

    def getInstance
      instance = Napakalaki.instance
    end

    def developCombat

    end

    def discardVisibleTreasures(treasures)

    end

    def discardHiddenTreasures(treasures)

    end

    def makeTreasuresVisible(treasures)

    end

    def initGame(players)

    end

    #Devuelve el jugador actual (currentPlayer).
    def getCurrentPlayer
      return @currentPlayer
    end

    #Devuelve el monstruo en juego (currentMonster).
    def getCurrentMonster
      return @currentMonster
    end

    def nextTurn

    end

    #Devuelve true si el parámetro result es WINGAME (valor del enumerado CombatResult). En
    #caso contrario devuelve false.
    def endOfGame(result)
      resultado
      if(result == CombatResult.WINGAME)
        resultado = true
      else 
        resultado = false
      end
      
      return resultado
      
    end
    
  end
  
end