# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer.rb"
require_relative "player.rb" 

require "singleton"

  class Napakalaki
    #Patrón Singleton
    include Singleton
    #Atributos
    attr_accessor :currentMonster, :dealer, :players, :currentPlayer
    #Constructor
    def initialize
      @dealer = CardDealer.instance
    end

    #Metodos

    #Inicializa el array de jugadores que contiene Napakalaki, creando tantos jugadores como
    #elementos haya en names, que es el array de String que contiene el nombre de los
    #jugadores.
    def initPlayers(names)
      #@dealer = CardDealer.instance
      @players = Array.new

      #creamos tantos jugadores como nombres 
      names.each do |nombre_jugador|
        player = Player.new(nombre_jugador)
        @players << player
      end     
      
    end
    private :initPlayers
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

      aux = 0
      posicion = 0
      contador = 0
      
      if(@currentPlayer.nil? ) then
        numeroJugadores = @players.length - 1
        posicion = Random.rand(0..numeroJugadores)
        aux = @players.at(posicion)
        @currentPlayer = aux
        
      else
       
        @players.each do |iterador|
          contador = contador + 1
          if(@currentPlayer == iterador)
            posicion = contador
          end
        end
        
        if (posicion >= @players.length)
          @currentPlayer = @players.at(0)
        else
          @currentPlayer = @players.at(posicion)
      end
      end
      return @currentPlayer
    end
    private :nextPlayer

      #Método que comprueba si el jugador activo (currentPlayer) cumple con las reglas del juego
      #para poder terminar su turno. Devuelve false si el jugador activo no puede pasar de turno y
      #true en caso contrario, para ello usa el método de Player validState() donde se realizan las
      #comprobaciones pertinentes.
    def nextTurnAllowed
      solucion = false
      if (@currentPlayer.nil?) then
        solucion = true
      else
        solucion = @currentPlayer.validState() #la primera vez currentPlayer está sin asignar
      end
      
      return solucion
    end
    private :nextTurnAllowed

    #Se asigna un enemigo a cada jugador. Esta asignación se hace de forma aleatoria teniendo
    #en cuenta que un jugador no puede ser enemigo de sí mismo.
    def setEnemies
      posAleatoria = 0
      tamanio = @players.length
      @players.each do |enemigo|
        posAleatoria = Random.rand(0 ..tamanio)
        
        while(@players.at(posAleatoria) == enemigo)
          posAleatoria = Random.rand(0 ..tamanio)
          
        end
        enemigo.setEnemy(@players.at(posAleatoria))
        end
    end
    private :setEnemies

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
      
      combatResult = @currentPlayer.combat(currentMonster)
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
      @dealer.initCards()
      nextTurn()
      


    end

    #Devuelve el jugador actual (currentPlayer).
    def getCurrentPlayer()
      return @currentPlayer
    end

    #Devuelve el monstruo en juego (currentMonster).
    def getCurrentMonster()
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
        dead = @currentPlayer.isDead()
        
        if(dead)
          @currentPlayer.initTreasures()
        end
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

