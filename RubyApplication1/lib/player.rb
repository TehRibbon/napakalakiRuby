# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'treasure'
require_relative 'dice.rb'
require_relative 'combat_result.rb'
require_relative 'napakalaki.rb'
require_relative 'bad_consequence.rb'



class Player
  
  #Atributos
  attr_accessor :MAXLEVEL, :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures, :enemy, :pendingBadConsequence
  @@MAXLEVEL = 10
  
  #Constructor
  def initialize(name)
    @name = name
    @pendingBadConsequence = BadConsequence.newLevelNumberOfTreasures("",0,0,0)
    @level = 1
    @dead = true
    @canISteal = true
    @hiddenTreasures = []
    @visibleTreasures = []
  end
  
  #def constructor_copia(player)
  #  @level = player.level
  #  @pendingBadConsequence = player.pendingBadConsequence
  #  @dead = player.dead
  #  @hiddenTreasures = player.hiddenTreasures
  #  @visibleTreasures = player.visibleTreasures
  #end
  
  #Metodos
  
  #Devuelve el nombre del jugador.
  def getname()
    return @name
  end
  
  #Devuelve la vida al jugador, modificando el atributo correspondiente.
  def bringToLife()
    @dead=false
  end
  private :bringToLife
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del
  #juego.
  def getCombatLevel()
    level=@level
    @visibleTreasures.each do |t|
      level += t.getBonus()
    end
    @hiddenTreasures.each do |t|
      level += t.getBonus()
    end
    
    return level
  end
  private :getCombatLevel
  
  #Incrementa el nivel del jugador en i niveles, teniendo en cuenta las reglas del juego.
  def incrementLevels(level)
    @level += level
  end
  private :incrementLevels
  
  def decrementLevels(level)
    if(level < 1) then
      @level = 1
    else
      @level = level - 1
    end
  end
  private :decrementLevels
  
  
  #Asigna el mal rollo al jugador, dándole valor a su atributo pendingBadConsequence.
  def setPendingBadConsequence(badConsequence)
    @pendingBadConsequence = badConsequence
  end
  private :setPendingBadConsequence
  
  def applyPrize(monster)
    incrementLevels(monster.getLevelsGained())
    nTreasures = monster.getTreasuresGained()
    
    deck = CardDealer.instance
    
    for i in 0..nTreasures-1
      @hiddenTreasures << deck.nextTreasure()
    end
  end
  private :applyPrize
  
  def applyBadConsequence(monster)
    badConsequence = monster.getBadConsequence()
    nLevels = badConsequence.getLevels()
    decrementLevels(nLevels)
    
    pendingBad = badConsequence.adjustToFitTreasureList(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  private :applyBadConsequence
  
  #Comprueba si el tesoro t se puede pasar de oculto a visible según las reglas del juego.
  def canMakeTreasureVisible(treasure)
    resultado = false;
    
    case treasure.getType
      
    when TreasureKind::ONEHAND
       if(isTreasureKindInUse(TreasureKind::BOTHHANDS)) then
         resultado = false
       else
         i = 0
         @visibleTreasures.each do |tesoros|
           if(tesoros.getType == TreasureKind::ONEHAND) then
             i += 1
           end
         end
       
         
        if(i == 2) then
          resultado = false;
        else
          resultado = true
        end
       end
     
    
    else
        resultado = !isTreasureKindInUse(treasure.getType())
     
    end
       return resultado
                  
    
    end
    private :canMakeTreasureVisible
  
  
  #Devuelve el número de tesoros visibles de tipo tKind que tiene el jugador.
  def howManyVisibleTreasures(tKind)
    contador = 0
    @visibleTreasures.each do |t|
      if(t.getType == tKind)
        ++contador
      end
    end
    return contador
  end
  private :howManyVisibleTreasures
  
  #Cambia el estado de jugador a muerto, modificando el correspondiente atributo.
  #Esto ocurre cuando el jugador, por algún motivo, ha perdido todos sus tesoros.
  def dieIfNoTreasures()
    if(@hiddenTreasures.empty? && @visibleTreasures.empty?) then
      dead = true
    end
  end
  private :dieIfNoTreasures
  
  #Devuelve true si el jugador está muerto, false en caso contrario.
  def isDead
    return dead
  end
    
  def getHiddenTreasures
    @hiddenTreasures
  end
  
  def getVisibleTreasures
    return @visibleTreasures
  end
  
  def combat(monster)
    myLevel = getCombatLevel()
    monsterLevel = monster.getCombatLevel()
    
    if(myLevel > monsterLevel)
      applyPrize(monster)
      if(@level >= @@MAXLEVEL)
        combatResult = NapakalakiGame::CombatResult::WINGAME  
      else
        combatResult = NapakalakiGame::CombatResult::WIN
      end
    else
      applyBadConsequence(monster)
      combatResult = NapakalakiGame::CombatResult::LOSE
    end
    
    return combatResult
  end
  
  #Operación en la que se pide al jugador actual que pase tesoros ocultos a visibles, siempre
  #que pueda hacerlo según las reglas del juego, para ello desde Player se ejecuta el método:
  #canMakeTreasureVisible(treasures:Treasure ):boolean
  def makeTreasureVisible(treasure)
   canI = canMakeTreasureVisible(treasure)
   
    if(canI)
      @visibleTreasures << treasure
      @hiddenTreasures.delete(treasure) 
    end
    
  end
  
  def discardVisibleTreasure(treasure)
    @visibleTreasures.delete(treasure)
    if((@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty()))
      @pendingBadConsequence.substractVisibleTreasure(treasure)
    end 
    dieIfNoTreasures()
  end
  
  def discardHiddenTreasure(treasure)
    @hiddenTreasures.delete(treasure)
    if((@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty()))
      @pendingBadConsequence.substractHiddenTreasure(treasure)
    end 
    dieIfNoTreasures()
    
  end
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos, y false en caso contrario. Para comprobar que el jugador
  #no tenga mal rollo que cumplir, utiliza el método isEmpty de la clase
  #BadConsequence.
  def validState()
      resultado = true;
      if( (!@pendingBadConsequence.isEmpty ) or (@hiddenTreasures.length > 4) )
            resultado = false;
            
      end
      return resultado
    
  end
  
  def initTreasures
    dealer = CardDealer.instance
    dice = Dice.instance
    
    bringToLife()
    treasure = dealer.nextTreasure()
    @hiddenTreasures << treasure
    
    number = dice.nextNumber()
    
    if( number == 6)
      treasure = dealer.nextTreasure()
      @hiddenTreasures << treasure
    end
    if( number > 1 )
      treasure = dealer.nextTreasure()
      @hiddenTreasures << treasure
    end
  end
  
  def isTreasureKindInUse(tipo)
    resultado = false
    @visibleTreasures.each do |treasure|
      if(tipo == treasure.getType()) then
        resultado = true
        break
      end
    end
    return resultado
  end
  #Devuelve el nivel del jugador
  def getLevels
    return level
  end
  
  def stealTreasure()
    
    canI = @canISteal
    if(canI)
      canYou = @enemy.canYouGiveMeATreasure()
      if(canYou)
        treasure = enemy.giveMeATreasure()    
        @hiddenTreasures << treasure
        haveStolen()
      end
    end
    return treasure
  end
  
  def getEnemy()
    return @enemy
  end
  #Asigna valor al atributo que referencia al enemigo del jugador.
  def setEnemy(enemy)
    @enemy = enemy
  end
  
  #Devuelve un tesoro elegido al azar de entre los tesoros ocultos del jugador.
  def giveMeATreasure
    max = @hiddenTreasures.length - 1
    posAleatoria = Random.rand(0..max)
    
    solucion = @hiddenTreasures.at(posAleatoria)
    @hiddenTreasures.delete(solucion)
    return solucion
    
    
  end
  
  #Devuelve true si el jugador no ha robado ningún tesoro a su enemigo y false en
  #caso contrario.
  def canISteal
    return @canISteal    

  end
  
  #Devuelve true si el jugador tiene tesoros para ser robados por otro jugador y false
  #en caso contrario.
  def canYouGiveMeATreasure
    canYou = false
    if(@hiddenTreasures.length > 0)
      canYou = true
    end
    return canYou
  end
  
  #Cambia el atributo canISteal a false cuando el jugador roba un tesoro.
  def haveStolen
    canISteal = false
  end
  
  def discardAllTreasures
    @visibleTreasures.each do |treasure|
      discardVisibleTreasure(treasure)
    end
    
    @hiddenTreasures.each do |treasure|
      discardHiddenTreasure(treasure)
    end
  end
  
  def to_s
    "#{@name}
    Level: #{@level}
    Dead: #{@dead}
    PendingBad: #{@pendingBadConsequence}"
  end

 end
