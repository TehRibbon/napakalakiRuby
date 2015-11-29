# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer"
require_relative "monster"
require_relative "player"

module Napakalaki

require "singleton"

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
      @dealer = CardDealer.instance #inicializo dealer
      @players = Array.new

      #creamos tantos jugadores como nombres 
      names.each do |nombre_jugador|
        players << Player.new(nombre_jugador)
      end
      nextPlayer()
      
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
      
      if(@currentPlayer == nil) then
        indice_siguiente = rand(total_jugadores)
      else
        indice_jugador_actual = @players.index(@currentPlayer)
        if(indice_jugador_actual == total_jugadores - 1) then
          indice_siguiente= 0
        else 
          indice_siguiente = indice_jugador_actual + 1
        end
      end
      
      
      siguiente_jugador = @players.at(indice_siguiente)
      @currentPlayer = siguiente_jugador

      return @currentPlayer
    end

      #Método que comprueba si el jugador activo (currentPlayer) cumple con las reglas del juego
      #para poder terminar su turno. Devuelve false si el jugador activo no puede pasar de turno y
      #true en caso contrario, para ello usa el método de Player validState() donde se realizan las
      #comprobaciones pertinentes.
    def nextTurnAllowed
      if (@currentPlayer == nil) then
        allowed = true #la primera vez currentPlayer está sin asignar
      else
        allowed = @currentPlayer.validState()
      end
      
      return allowed
    end

    #Se asigna un enemigo a cada jugador. Esta asignación se hace de forma aleatoria teniendo
    #en cuenta que un jugador no puede ser enemigo de sí mismo.
    def setEnemies
      posAleatoria = 0
      tamanio = @players.length
      @players.each do |enemigo|
        posAleatoria = Random.rand(1 ..tamanio)
        
        while(@players.at(posAleatoria) == enemigo)
          posAleatoria = Random.rand(1 ..tamanio)
          
        end
        enemigo.setEnemy(@players.at(posAleatoria))
        end
    end
    

    def getInstance
      instance = Napakalaki.instance
    end

    #Operación responsabilidad de la única instancia de Napakalaki, la cual pasa el control al
    #jugador actual (currentPlayer) para que lleve a cabo el combate con el monstruo que le ha
    #tocado (currentMonster). El método de la clase Player con esa responsabilidad es
    #combat(currentMonster:Monster): CombatResult, cuyo comportamiento general (también
    #reflejado en el diagrama y responsabilidad de Player) es: si el nivel de combate del jugador
    #supera al del monstruo, se aplica el buen rollo y se puede ganar el combate o el juego, en
    #otro caso, el jugador pierde el combate y se aplica el mal rollo correspondiente.
    def developCombat
      
      combatResult = @currentPlayer.combat
      dealer.giveMonsterBack(@currentMonster)
      return combatResult

    end

    def discardVisibleTreasures(treasures)
      treasures.each do |descartado|
        @currentPlayer.discardVisibleTreasure(descartado)
        @dealer.giveTreasureBack(descartado)
        
      end
    end

    def discardHiddenTreasures(treasures)
      treasures.each do |descartado|
        @currentPlayer.discardHiddenTreasure(descartado)
        @dealer.giveTreasureBack(descartado)
      end
    end

    def makeTreasuresVisible(treasures)
      treasures.each do |t|
        @currentPlayer.makeTreasureVisible(t)
      end
    end

    #Se encarga de solicitar a CardDealer la inicialización de los mazos de cartas de Tesoros y
    #de Monstruos, de inicializar los jugadores proporcionándoles un nombre, asignarle a cada
    #jugador su enemigo y de iniciar el juego con la llamada a nextTurn() para pasar al siguiente
    #turno (que en este caso será el primero).
    def initGame(players)
      
      initPlayers(players)
      setEnemies()
      dealer.initCards()
      nextTurn()
      

    end

    #Devuelve el jugador actual (currentPlayer).
    def getCurrentPlayer
      return @currentPlayer
    end

    #Devuelve el monstruo en juego (currentMonster).
    def getCurrentMonster
      return @currentMonster
    end

    
    #Esta operación usa el método nextTurnAllowed(), donde se verifica si el jugador activo
    #(currentPlayer) cumple con las reglas del juego para poder terminar su turno.
    #En caso el caso que nextTurnIsAllowed() devuelva true, se le solicita a CardDealer el
    #siguiente monstruo al que se enfrentará ese jugador (currentMonster) y se actualiza el
    #jugador activo al siguiente jugador.
    #En caso de que el nuevo jugador activo esté muerto, por el comb ate en su anterior turno o
    #porque es el primer turno, se inicializan sus tesoros siguiendo las reglas del juego. La
    #inicialización de los tesoros se encuentra recogida en el diagrama subordinado
    #initTreasures.
    def nextTurn
      stateOk = nextTurnAllowed()
      
      if(stateOk) then
        @currentMonster = @dealer.nextMonster()
        @currentPlayer = nextPlayer()
        @dead = isDead()
        if(dead)
          @currentPlayer.initTreasures()
        end
        
      else
        @currentMonster = @dealer.nextMonster()
      end
      
      if(@currentPlayer = nil)
        stateOk = true
      end

     return stateOk
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
    
    def to_s
      "\n #{@name}"
    end
  end
  
end