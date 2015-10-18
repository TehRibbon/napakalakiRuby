# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class TreasureKind
  attr_accesor :armor
  attr_accesor :onehand
  attr_accesor :bothhands
  attr_accesor :helmet
  attr_accesor :shoes
  
  def initialize
    @ARMOR =:armor
    @ONEHAND =:onehand
    @BOTHHANDS =:bothhands
    @HELMET =:helmet
    @SHOES  =:shoes
  end
end
