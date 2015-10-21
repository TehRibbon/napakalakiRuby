# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
puts "Creacion de objetos de prueba de las distinta clases creadas"

#prueba bad consequence
mal_rollo = BadConsequence.initialize("hola",5,3,2,Array.new, Array.new, 0)

#prueba Prize
premio = Prize.initialize(5, 3)

#prueba monster
monstruo = Monster.initialize("pepito el monstruo", 5, mal_rollo, premio)

a = [4,5]
puts a

#puts mal_rollo.levels

#puts premio.treasures
