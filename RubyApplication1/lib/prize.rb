# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_accessor :treasures
  attr_accessor :level
  
  def self.initialize(treasures,level)
   @treasures = treasures
   @level = level
  end
  
  def to_s
    "Tesoros ganados: #{@treasure} \n Niveles ganados: #{@levels}"
  end
 
end