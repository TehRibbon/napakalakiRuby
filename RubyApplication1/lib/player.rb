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
    return name
  end
  
  #Devuelve la vida al jugador, modificando el atributo correspondiente.
  def bringToLife()
    dead=false
  end
  
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del
  #juego.
  def getCombatLevel()
    @visibleTreasures.each do |t|
      level += t.getBonus()
    end
    @hiddenTreasures.each do |t|
      level += t.getBonus()
    end
    
    return level
  end
  
  #Incrementa el nivel del jugador en i niveles, teniendo en cuenta las reglas del juego.
  def incrementLevel()
    ++level
  end
  
  def decrementLevel()
    if(level < 1) then
      level = 1
    else
      --level
    end
  end
  
  
  #Asigna el mal rollo al jugador, dándole valor a su atributo pendingBadConsequence.
  def setPendingBadConsequence(badConsequence)
    @pendingBadConsequence = badConsequence
  end
  
  def applyPrize()
    
  end
  
  def applyBadConsequence()
    
  end
  
  def canMakeTreasureVisible(treasure)
    
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
    
  end
  
  def makeTreasureVisible(treasure)
    
  end
  
  def discardVisibleTreasure(treasure)
    
  end
  
  def discardHiddenTreasure(treasure)
    
  end
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos, y false en caso contrario. Para comprobar que el jugador
  #no tenga mal rollo que cumplir, utiliza el método isEmpty de la clase
  #BadConsequence.
  def validState
    resultado = false
    if(pendingBadConsequence.isEmpty && hiddenTreasures <= 4 ) then
      resultado = true
    end
    return resultado
  end
  
  def initTreasures
    
  end
  
  #Devuelve el nivel del jugador
  def getLevels
    return level
  end
  
  def stealTreasure
    
  end
  
  def getEnemy()
    return @enemy
  end
  #Asigna valor al atributo que referencia al enemigo del jugador.
  def setEnemy(enemy)
    @enemy = enemy
  end
  
  def giveMeATreasure
    
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
    
  end

end
end