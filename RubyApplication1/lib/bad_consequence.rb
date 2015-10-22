  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8

class BadConsequence
  attr_accessor :text, :levels, :nVisiblesTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  private_class_method :new
  
  def initialize(text, levels, nVisiblesTreasures, nHiddenTreasures, specificVisibleTreasures, specificHiddenTreasures, death)
    @text = text
    @levels = levels
    @nVisiblesTreasures = nVisiblesTreasures
    @nHiddenTreasures = nHiddenTreasures
    @specificHiddenTreasures = specificHiddenTreasures
    @specificVisibleTreasures = specificVisibleTreasures
    @death = death
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
  
  def to_s
    
    "\n#{@text} 
    \nNiveles que se pierden: #{@levels} 
    \nTesoros visibles que se pierden: #{@nVisiblesTreasures} 
    \nTesoros ocultos que se pierden: #{@nHiddenTreasures}
    \nTesoros visibles especificos que se pierden: #{@specificVisibleTreasures}
    \nTesoros ocultos especificos que se pierden: #{@specificHiddenTreasures}
    \nMuerte: #{@death}"
  end

  
end
