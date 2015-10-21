# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class TreasureKind
  attr_accesor :armor
  attr_accesor :onehand
  attr_accesor :bothhands
  attr_accesor :helmet
  attr_accesor :shoes
  
  def self.initialize(armor, onehand, bothhands, helmet, shoes)
    @armor = armor
    @onehand = onehand
    @bothhands = bothhands
    @helmet = helmet
    @shoes = shoes
    
    
  end
  def to_s(armor, onehand, bothhands, helmet, shoes)
    @Override
    solucion = "";
    puts case this
    when armor
       solucion = "ARMOR"
    when onehand
       solucion = "ONEHAND"
    when bothhands
       solucion = "BOTHHANDS"
    when helmet
       solucion = "HELMET"
    when shoes
       solucion = "SHOES"
    else
    end
    solucion
  end
    
    
  
end
