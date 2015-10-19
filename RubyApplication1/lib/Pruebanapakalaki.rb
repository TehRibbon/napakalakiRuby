# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
puts "Creacion de objetos de prueba de las distinta clases creadas"

#prueba bad consequence
mal_rollo = BadConsequence.new("hola",5,3,2)
#prueba Prize
premio = Prize.new(5, 3)
#prueba monster
monstruo = Monster.new("pepito el monstruo", 5, mal_rollo, premio)

puts monstruo.combatLevel

puts mal_rollo.levels

puts premio.treasures
