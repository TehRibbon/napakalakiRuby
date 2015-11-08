# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"

require_relative "card_dealer"
require_relative "monster"
require_relative "player"

class Napakalaki
  #Patrón Singleton
  include Singleton
  #Atributos
  attr_accessor :currentMonster, :dealer, :players, :currentPlayers
  #Constructor
  def initialize
    
  end
  
  #Metodos
  def initPlayers(names)
    
  end
  
  def nextPlayer
    
  end
  
  def nextTurnAllowed
    
  end
  
  def setEnemies
    
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
  
  def getCurrentPlayer
    
  end
  
  def getCurrentMonster
    
  end
  
  def nextTurn
    
  end
  
  def endOfGame(result)
    
  end
end
