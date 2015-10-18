# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  attr_accessor :text
  attr_accesor :levels
  attr_accesor :nVisiblesTreasures
  attr_accesor :nHiddenTreasures
  attr_accesor :death
  attr_accesor :specificHiddenTreasures
  attr_accesor :specificVisibleTreasures
  
  def initialize(text, levels, nVisiblesTreasures, nHiddenTreasures)
    @text = text
    @levels = levels
    @nVisiblesTreasures = nVisiblesTreasures
    @nHiddenTreasures = nHiddenTreasures
  end
  
  def initialize(text, levels, specificHiddenTreasures, specificVisibleTreasures)
    @text = text
    @levels = levels
    @specificHiddenTreasures = specificHIddenTreasures
    @specificVisibleTreasures = specificVisibleTreasures
  end
  
  def initialize(text,death)
    @text = text
    @death = death
  end
  #CONSULTORES
  def text
    @text
  end
  
  def levels
    @levels
  end
  
  def nVisiblesTreasures
    @nVisiblesTreasures
  end
  
  def nHiddenTreasures
    @nHiddenTreasures
  end
  
  def death
    @death
  end
  
  def specificHiddenTreasures
    @specificHiddenTreasures
  end
 
  def specificVisibleTreasures
    @specificVisibleTreasures
  end
  
end
