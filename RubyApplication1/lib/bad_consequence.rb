  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  attr_accessor :text
  attr_accessor :levels
  attr_accessor :nVisiblesTreasures
  attr_accessor :nHiddenTreasures
  attr_accessor :death
  attr_accessor :specificHiddenTreasures
  attr_accessor :specificVisibleTreasures
  
  def initialize(text, levels, nVisiblesTreasures, nHiddenTreasures)
    @text = text
    @levels = levels
    @nVisiblesTreasures = nVisiblesTreasures
    @nHiddenTreasures = nHiddenTreasures
  end
  
  def self.newConstructor(text, levels, specificHiddenTreasures, specificVisibleTreasures)
    nuevoObj = allocate
    nuevoObj.send(:initialize,text,levels,specificHIddenTreasures,specificVisibleTreasures)
    nuevoObj
  end
  
  def self.newConstructor2(text,death)
    nuevoObj2 = allocate
    nuevoObj2.send(:initialize, text, death, nil, nil)
    nuevoObj2
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
