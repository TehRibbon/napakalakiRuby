  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8

class BadConsequence
  attr_accessor :text, :levels
  MAXTREASURES = 10
  
  
  def initialize(text, levels)
    @text = text
    @levels = levels
    
  end
  private_class_method :new  
    
  
  def getMAXTREASURES
    MAXTREASURES
  end
  
  #Devuelve true cuando el mal rollo que tiene que cumplir el jugador está vacío, eso
  #significa que el conjunto de atributos del mal rollo indican que no hay mal rollo que
  #cumplir. Plantéate qué valores deberán tener.
  def isEmpty
    raise NotImplementedError.new
  end
  
  def getLevels
    return levels
  end
  
  def getNVisiblesTreasures
    raise NotImplementedError.new
  end
  
  def getNHiddenTreasures
    raise NotImplementedError.new
  end
  
  def getSpecificVisibleTreasures
    raise NotImplementedError.new
  end
  
  def getSpecificHiddenTreasures
    raise NotImplementedError.new
  end
  
  def getDeath
    raise NotImplementedError.new
  end
  
  #Actualiza el mal rollo para que el tesoro visible t no forme parte del mismo. Es posible que
  #esta actualización no implique cambio alguno, que lleve a eliminar un tipo específico de
  #tesoro visible, o a reducir el número de tesoros visibles pendientes.
  def substractVisibleTreasure(treasure)
    raise NotImplementedError.new
  end
  
  #Igual que el anterior, pero para los ocultos.
  def substractHiddenTreasure(treasure)
    raise NotImplementedError.new
  end
  
  def adjustToFitTreasureList(v,h) #tanto v como h son vectores de tipo Treasure(cambiar nombre de la variable al implementar)
    raise NotImplementedError.new
  end
  def to_s
    
    "\n    #{@text} 
    Niveles que se pierden = #{@levels}"
  end

  
end

#Devuelve true cuando el mal rollo que tiene que cumplir el jugador está vacio

def is_empty
      raise NotImplementedError.new
end
