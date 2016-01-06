# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SpecificBadConsequence < BadConsequence
  attr_accessor :specificHiddenTreasures, :specificVisibleTreasures

  
  def initialize(text, levels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    super(text, levels)
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    #ERROR: -> Los dos primeros elementos de someSpecificVisibleTreasures y de someHiddenTreasures siempre vale 0, por lo tanto falla en ocasiones al encontrarse este valor
    puts @specificHiddenTreasures
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
      if(tVisible.index(t.type) == nil) then
        tVisible << t.type
      end
    end
    
    h.each do |t|
      if(tHidden.index(t.type) == nil) then
        tHidden << t.type
      end
    end
    
    bs = SpecificBadConsequence.new("", 0, tVisible, tHidden)
  
    return bs
  
  end
  
  def to_s
    
    "\n
    Tesoros visibles especificos que se pierden = #{@specificVisibleTreasures}
    Tesoros ocultos especificos que se pierden = #{@specificHiddenTreasures}"
  end

end
