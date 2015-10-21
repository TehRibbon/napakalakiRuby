  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  attr_accessor :text, :levels, :nVisiblesTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  private_class_method :new
  
  def initialize(aText, someLevels, someVisiblesTreasures, someHiddenTreasures, someSpecificHiddenTreasures, someSpecificVisibleTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisiblesTreasures = someVisiblesTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @death = death
  end
  
  
  def BadConsequence.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new ,0)
  end   
    
  def BadConsequence.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText, someLevels, someSpecificVisibleTreasures, somSpecificHiddenTreasures,0 , Array.new, Array.new)
    
  end
  
  def BadConsequence.newDeath(aText, death)
    new(aText, 0, 0 ,0, death, Array.new, Array.new )
    
    
  end
  
 
  

  def to_s
    "#{@text} \n Niveles que se pierden: #{@levels} 
     \n Tesoros visibles que se pierden: #{@nVisiblesTreasures} 
     \n Tesoros ocultos que se pierden: #{@nHiddenTreasures}
     \n Tesoros ocultos específicos que se pierden #{@specificHiddenTreasures}  
     \n Tesoros visibles específicos que se pierden: #{@specificVisibleTreasures}"
  end

  
end
