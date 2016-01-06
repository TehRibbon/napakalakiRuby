# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.



class Treasure 
 
  #Atributos
  attr_accessor :name, :bonus, :type 
    
  #Constructor
  def initialize(name, bonus, treasure)
    @name = name
    @bonus = bonus
    @type = treasure
  end
  
  def getName
    return @name
  end
  
  def getBonus
    return @bonus
  end
  
  def getType
    return @type
  end
  
  def to_s()
    return "\nNombre: #{@name} 
    \tBonus: #{@bonus} 
    \tTipo: #{@type} "
   
  end
end
