# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  attr_accessor :name 
  attr_accessor :combatLevel
  attr_accessor :malRollo #atributo de la clase BadConsequence
  attr_accessor :premio   #Atributo de la clase Prize
  
  def self.initialize(name, combatLevel, malRollo, premio)
   @name = name
   @combatLevel = combatLevel
   @malRollo = malRollo
   @premio = premio
  end
  
  def to_s
    "Nombre: #{@name} \n Nivel de combate: #{@combatLevel} \n Mal rollo: #{@malRollo} \n Premio: #{@premio}"
  end
  
end
