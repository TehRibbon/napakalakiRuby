  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8

class BadConsequence
  attr_accessor :text, :levels, :nVisiblesTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures, :MAXTREASURES
  private_class_method :new
  
  def initialize(text, levels, nVisiblesTreasures, nHiddenTreasures, specificVisibleTreasures, specificHiddenTreasures, death)
    @text = text
    @levels = levels
    @nVisiblesTreasures = nVisiblesTreasures
    @nHiddenTreasures = nHiddenTreasures
    @specificHiddenTreasures = specificHiddenTreasures
    @specificVisibleTreasures = specificVisibleTreasures
    @death = death
    @MAXTREASURES = 10
  end
  
  
  def BadConsequence.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new ,false)
  end   
    
  def BadConsequence.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText, someLevels,0 ,0 , someSpecificVisibleTreasures, someSpecificHiddenTreasures, false)
    
  end
  
  def BadConsequence.newDeath(aText)
    new(aText, 0, 0 ,0, Array.new, Array.new, true)
    
  end
  
  def getMAXTREASURES
    return MAXTREASURES
  end
  
  def isEmpty
    empty = false
    
    if(text.empty? && death == false && levels == 0 && nVisiblesTreasures == 0 && nHiddenTreasures == 0 && specificVisibleTreasures.empty? && specificHiddenTreasures.empty?) then
      empty = true
    end
    
    return empty
  end
  
  def getLevels
    return levels
  end
  
  def getNVisiblesTreasures
    return nVisiblesTreasures
  end
  
  def getNHiddenTreasures
    return nHiddenTreasures
  end
  
  def getSpecificVisibleTreasures
    return specificVisibleTreasures
  end
  
  def getSpecificHiddenTreasures
    return speficicHiddenTreasures
  end
  
  def substractVisibleTreasure(treasure)
    
  end
  
  def substractHiddenTreasure(treasure)
    
  end
  
  def adjustToFitTreasureLists(v,h) #tanto v como h son vectores de tipo Treasure(cambiar nombre de la variable al implementar)
    
  end
  
  def to_s
    
    "\n    #{@text} 
    Niveles que se pierden = #{@levels} 
    Tesoros visibles que se pierden = #{@nVisiblesTreasures} 
    Tesoros ocultos que se pierden = #{@nHiddenTreasures}
    Tesoros visibles especificos que se pierden = #{@specificVisibleTreasures}
    Tesoros ocultos especificos que se pierden = #{@specificHiddenTreasures}
    Muerte: #{@death}"
  end

  
end

#Devuelve true cuando el mal rollo que tiene que cumplir el jugador está vacio

def is_empty
      
        empty = false
      
        if (@levels == 0 && @death == false && @nHiddenTreasures == 0 && @nVisibleTreasures == 0  && @specificHiddenTreasures.empty && @specificVisibleTreasures.empty) then
        
            empty = true
        end
        
        return empty
end