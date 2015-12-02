  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8

class BadConsequence
  attr_accessor :text, :levels, :nVisiblesTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  MAXTREASURES = 10
  
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
  
  def getMAXTREASURES
    return MAXTREASURES
  end
  
  #Devuelve true cuando el mal rollo que tiene que cumplir el jugador está vacío, eso
  #significa que el conjunto de atributos del mal rollo indican que no hay mal rollo que
  #cumplir. Plantéate qué valores deberán tener.
  def isEmpty
    empty = false
    
    if(text == "" && death == false && levels == 0 && nVisiblesTreasures == 0 && nHiddenTreasures == 0 && specificVisibleTreasures.empty? && specificHiddenTreasures.empty?) then
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
  
  #Actualiza el mal rollo para que el tesoro visible t no forme parte del mismo. Es posible que
  #esta actualización no implique cambio alguno, que lleve a eliminar un tipo específico de
  #tesoro visible, o a reducir el número de tesoros visibles pendientes.
  def substractVisibleTreasure(treasure)
    @specificVisibleTreasures.delete(treasure.getType)
  end
  
  #Igual que el anterior, pero para los ocultos.
  def substractHiddenTreasure(treasure)
    @specificHiddenTreasures.delete(treasure.getType)
  end
  
  def adjustToFitTreasureList(v,h) #tanto v como h son vectores de tipo Treasure(cambiar nombre de la variable al implementar)
    
    if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?)
      visibles = 0
      ocultos = 0
      tamV = v.length
      tamO = h.length
      
      if(@nVisiblesTreasures <= tamV)
        visibles = @nVisiblesTreasures
      elsif (tamV < @nVisiblesTreasures)
        visibles = tamV
      end
      
      if(@nHiddenTreasures <= tamO)
        ocultos = @nHiddenTreasures
      elsif(tamO < @nHiddenTreasures)
        ocultos = tamO
      end
      
      bs = BadConsequence.newLevelNumberOfTreasures("",0, visibles, ocultos) 
    else
    
    tVisible = Array.new
    tHidden = Array.new
    
    v.each do |t|
      if(tVisible.index(t.type) == nil) then
        tVisible << t.type
      end
    end
    
    h.each do |t|
      if(tHidden.index(t.type) == nil) then
        tHidden << t.type
      end
    end
    
    bs = BadConsequence.newLevelSpecificTreasures("", 0, tVisible, tHidden)
  end
    return bs
  
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
