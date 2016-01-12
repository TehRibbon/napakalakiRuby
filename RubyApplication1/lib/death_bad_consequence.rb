# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class DeathBadConsequence < NumericBadConsequence
  attr_accessor :death
  
  def initialize(aText)
    super(aText,0,0,0)
    @death = true
  end
  public_class_method :new
 
  def isEmpty
    if(@death == false) then
      empty = true
    else
      empty = false
    end
    
    return empty
  end
  
  def getDeath
    return @death
  end
  
  def to_s
    
    "#{@text} 
    Niveles que se pierden = #{@levels}
    \nMuerte: #{@death}"
  end
end
