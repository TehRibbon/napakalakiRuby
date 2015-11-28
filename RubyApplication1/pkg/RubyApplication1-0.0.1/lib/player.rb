# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
require_relative "treasure"
require_relative "dice"
require_relative "player"
class Player
  
  #Atributos
  attr_accessor :MAXLEVEL, :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures, :enemy, :pendingBadConsequence
  @@MAXLEVEL = 10
  
  #Constructor
  def initialize(name)
    
  end
  
  #Metodos
  
  #Devuelve el nombre del jugador.
  def getname()
    return @name
  end
  
  #Devuelve la vida al jugador, modificando el atributo correspondiente.
  def bringToLife()
    @dead=false
  end
  
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del
  #juego.
  def getCombatLevel()
    @visibleTreasures.each do |t|
      @level += t.getBonus()
    end
    @hiddenTreasures.each do |t|
      @level += t.getBonus()
    end
    
    return level
  end
  
  #Incrementa el nivel del jugador en i niveles, teniendo en cuenta las reglas del juego.
  def incrementLevel()
    @level = level + 1
  end
  
  def decrementLevel()
    if(level < 1) then
      @level = 1
    else
      @level = level - 1
    end
  end
  
  
  #Asigna el mal rollo al jugador, dándole valor a su atributo pendingBadConsequence.
  def setPendingBadConsequence(badConsequence)
    @pendingBadConsequence = badConsequence
  end
  
  def applyPrize(monster)
    nLevels = monster.getLevelsGained()
    incrementLevels(nLevels)
    nTreasures = monster.getTreasuresGained()
    
    if(nTreasures > 0)
       @dealer = CardDealer.instance
       nTreasures.each do |treasure|
          
          @hiddenTreasures << treasure
         
       end
    end
  end
  
  def applyBadConsequence(monster)
    badConsequence = monster.getBadConsequence()
    nLevels = badConsequence.getLevels()
    decrementLevels(nLevels)
    
    pendingBad = badConsequence.adjustToFitTreasureList(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  
  #Comprueba si el tesoro t se puede pasar de oculto a visible según las reglas del juego.
  def canMakeTreasureVisible(treasure)
    resultado = false;
    
    case treasure.type
      
    when ONEHAND
       if(treasure == BOTHHANDS) then
         resultado = false
       else
         i = 0
         @visibleTreasures.each do |tesoros|
           if(tesoros.getType == ONEHAND) then
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
     if(visibleTreasures.isEmpty && hiddenTreasures.isEmpty)
       resultado = true
     else
       resultado = fasle
     end
    end
    return resultado
                  
    
    end
  
  
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
  
  #Cambia el estado de jugador a muerto, modificando el correspondiente atributo.
  #Esto ocurre cuando el jugador, por algún motivo, ha perdido todos sus tesoros.
  def dieIfNoTreasures()
    if(hiddenTreasures.isEmpty && visibleTreasures.isEmpty) then
      dead = true
    end
  end
  
  #Devuelve true si el jugador está muerto, false en caso contrario.
  def isDead
    @dead = false
    if(this.dead == true)
      dead=true
    end
  return dead
  end
    
  def getHiddenTreasures
    
  end
  
  def getVisibleTreasures
    
  end
  
  def combat(monster)
    combatResult
    myLevel = getCombatLevel()
    monstersLevel = monster.getCombatLevel()
    
    if(myLevel > monstersLevel)
      applyPrize(monster)
      if(@level >= MAXLEVEL)
        combatResult = WINGAME  
      else
        combatResult = WIN
      end
    else
      applyBadConsequence(monster)
      combatResult = LOSE
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
    @visibleTreasures.remove(treasure)
    if((pendingBadConsequence != null) && (!pendingBadConsequence.isEmpty()))
      pendingBadConsequence.substractVisibleTreasure(treasure)
    end 
    dieIfNoTreasures()
  end
  
  def discardHiddenTreasure(treasure)
    @HiddenTreasures.remove(treasure)
    if((pendingBadConsequence != null) && (!pendingBadConsequence.isEmpty()))
      pendingBadConsequence.substractHiddenTreasure(treasure)
    end 
    dieIfNoTreasures()
    
  end
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos, y false en caso contrario. Para comprobar que el jugador
  #no tenga mal rollo que cumplir, utiliza el método isEmpty de la clase
  #BadConsequence.
  def validState()
    return ( (@badConsequence != nil) && (@hiddenTreasures <= 4) )
  end
  
  def initTreasures
    dealer = CardDealer.instance
    dice = Dice.instance
    
    bringToLife()
    treasure = dealer.nextTreasure()
    @hiddenTreasures << treasure
    
    number = dice.nextNumber()
    
    if( number == 1)
      treasure = dealer.nextTreasure()
      @hiddenTreasures << treasure
    end
    if( number > 1 )
      treasure = dealer.nextTreasure()
      @hiddenTreasures << treasure
    end
    if ( number == 6 )
      treasure = dealer.nextTreasure()
      @hiddenTreasures << treasure
    end
  end
  
  #Devuelve el nivel del jugador
  def getLevels
    return level
  end
  
  def stealTreasure()
    treasure
    canI = @canISteal
    if(canI)
      canYou = @enemy.canYouGiveMeATreasure()
      if(canYou)
        treasure = enemy.giveMeATreasure()    
        @hiddenTreasures << treasure
        haveStolen()
      end
    else
      treasure = nil
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
    
    numero = Random.rand.next(HiddenTreasures.length + 1)
    tesoro = HiddenTreasures.get(numero)
    return tesoro    
    
    
  end
  
  #Devuelve true si el jugador no ha robado ningún tesoro a su enemigo y false en
  #caso contrario.
  def canISteal
    return canISteal    
    
  end
  
  #Devuelve true si el jugador tiene tesoros para ser robados por otro jugador y false
  #en caso contrario.
  def canYouGiveMeATreasure
    canYou = false
    if(canISteal == true)
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

 end
end