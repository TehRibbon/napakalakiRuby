# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'

class Monster
  attr_accessor :name 
  attr_accessor :combatLevel
  attr_accessor :malRollo #atributo de la clase BadConsequence
  attr_accessor :premio #Atributo de la clase Prize
  attr_accessor :levelChangeAgainstCultistPlayer
  
  def initialize(name, combatLevel, premio, malRollo)
   @name = name
   @combatLevel = combatLevel
   @premio = premio
   @malRollo = malRollo
   @levelChangeAgainstCultistPlayer = 0
  end
  
  def Monster.newMonster(name, level, badConsequence, prize, ic)
    @name = name
    @combatLevel = level
    @malRollo = badConsequence
    @premio = prize
    @levelChangeAgainstCultistPlayer = ic
  end
  def getCombatLevelAgainstCultistPlayer
    
  end
  
  def getCombatLevel
    return @combatLevel
  end
  #Devuelve el número de niveles ganados proporcionados por su buen rollo.
  def getLevelsGained
        
    return @premio.level
  end
    
  #Devuelve el número de tesoros ganados proporcionados por su buen rollo.
  def getTreasuresGained

    return @premio.treasures
  
  end
  
  def getBadConsequence
    return malRollo 
  end
  
  def to_s
    "Nombre: #{@name} \nNivel de combate: #{@combatLevel} \nMal rollo: #{@malRollo.to_s} \nPremio: #{@premio.to_s}"
  end
  
end


