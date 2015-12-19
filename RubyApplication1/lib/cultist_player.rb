# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  
  attr_accessor :totalCultistPlayer, :myCultistCard
  def initialize(p, c)
    super(p)
    @myCultistCard = c
    @totalCultistPlayer + 1

  end

  def getCombatLevel
    
    
  end
  
  def getOponentLevel(m)
    m.getCombatLevelAgainstCultistPlayer
    
  end
  
  def shouldConvert
    
  end
  
  def giveMeATreasure
    
  end
  private :giveMeATreasure
  
  def canYouGiveMeATreasure
    
  end
  private :canYouGiveMeATreasure
  
  def getTotalCultistPlayers
    
  end
end
