# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class NumericBadConsequence < BadConsequence
  attr_accessor :nVisiblesTreasures, :nHiddenTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    super(aText, someLevels)
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
  end   
  
  public_class_method :new
  
  
  def isEmpty
  if(@nVisiblesTreasures == 0 && @nHiddenTreasures == 0) then
      empty = true
    else
      empty = false
    end
    
    return empty
    
  end
  
  def getNVisiblesTreasures
    return @nVisiblesTreasures
  end
  
  def getNHiddenTreasures
    return @nHiddenTreasures
  end
  
  def adjustToFitTreasureList(v,h) #tanto v como h son vectores de tipo Treasure(cambiar nombre de la variable al implementar)
   
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
      
      bs = new("",0, visibles, ocultos) 
    
    
    return bs
  
  end
  
  def to_s
    
    "\nTesoros visibles que se pierden = #{@nVisiblesTreasures} 
    Tesoros ocultos que se pierden = #{@nHiddenTreasures}"
    
  end
  
  
end
