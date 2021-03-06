# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SpecificBadConsequence < BadConsequence
  attr_accessor :specificHiddenTreasures, :specificVisibleTreasures

  
  def initialize(text, levels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    super(text, levels)
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    
  end
  public_class_method :new
  
  def isEmpty
    empty = false
    if(@specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?) then
      empty = true
    end
    
    return empty
  end
  
  def getSpecificVisibleTreasures
    return @specificVisibleTreasures
  end
  
  def getSpecificHiddenTreasures
    return @specificHiddenTreasures
  end
  
  def substractVisibleTreasure(treasure)
    @specificVisibleTreasures.delete(treasure.getType)
  end
  
  def substractHiddenTreasure(treasure)
    @specificHiddenTreasures.delete(treasure.getType)
  end
  
  def adjustToFitTreasureList(v,h) #tanto v como h son vectores de tipo Treasure(cambiar nombre de la variable al implementar)
    tVisible = Array.new
    tHidden = Array.new
    v.each do |t|
      if(@specificVisibleTreasures.include?(t.type))
        tVisible << t.type
      end
    end
    
    h.each do |t|
      if(@specificHiddenTreasures.include?(t.type))
        tHidden << t.type
      end
    end
    bs = SpecificBadConsequence.new("", @levels, tVisible, tHidden)
  
    return bs
  
  end
  
  def to_s
    
    "\n
    #{@text} 
    Niveles que se pierden = #{@levels}
    Tesoros visibles especificos que se pierden = #{@specificVisibleTreasures}
    Tesoros ocultos especificos que se pierden = #{@specificHiddenTreasures}"
  end

end
