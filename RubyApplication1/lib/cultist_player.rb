# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  
  attr_accessor :totalCultistPlayer, :myCultistCard
  def initialize(p, c)
    super.newCopia(p)
    @myCultistCard = c
    @totalCultistPlayer + 1

  end

  @Override
  def getCombatLevel
    nivel = super.getCombatLevel
    porcentaje = nivel * 0.20
    suma = porcentaje + nivel
    resultado = nivel + porcentaje +(@myCultistsCard.getGainedLevels * @totalCultistPlayer)
    return resultado
    
  end
  protected :getCombatLevel
  
  @Override
  def getOponentLevel(m)
    m.getCombatLevelAgainstCultistPlayer
    
  end
  protected :getOponentLevel
  
  @Override
  def shouldConvert
    return false
  end
  protected :shouldConvert
  
  @Override
  def giveMeATreasure
    pos = getVisibleTreasures.lenght
    posAleatoria = rand(pos)
    solucion = getVisibleTreasures.at(posAleatoria)
    return solucion
  end
  private :giveMeATreasure
  
  def canYouGiveMeATreasure
    solucion = false;
        
        if(getVisibleTreasures.length > 0)
            solucion = true;
        end
        
    return solucion;
  end
  private :canYouGiveMeATreasure
  
  def getTotalCultistPlayers
    
  end
end
