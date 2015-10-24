# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#!/bin/env ruby
# encoding: utf-8

require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'


#puts "Creacion de objetos de prueba de las distinta clases creadas"

#prueba bad consequence
mal_rollo = BadConsequence.newLevelNumberOfTreasures("hola",5,3,5)

#prueba Prize
premio = Prize.new(5,3)

#prueba monster
#monstruo = Monster.new("pepito el monstruo", 5, mal_rollo, premio)

#DEFINICION MAZO CARTAS
monsters = Array.new

#El rey de la rosa
prize = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",5 , 3, 0)
monsters << Monster.new("El rey de rosa",13,prize,badConsequence)

#Ángeles de la noche ibicenca
prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
monsters<< Monster.new("Angeles de la noche ibicenca", 14, prize, badConsequence)

#

#COMPROBACIONES

puts "Tienen un nivel de combate superior a 10: \n\n"


for iterador in monsters
  if (iterador.combatLevel > 10) then
    puts iterador.to_s
    puts "\n"
  end
end

puts "Tienen un mal rollo que implica solo perdida de niveles: \n\n"

for iterador in monsters
  if (iterador.malRollo.levels > 0) then
     puts iterador.to_s
     puts "\n"
  end
end

puts "Su buen rollo indica una ganancia de niveles superior  a 1: \n\n"

for iterador in monsters
  if (iterador.premio.level > 1) then
    puts iterador.to_s
    puts "\n"
  end
end

puts "Su mal rollo supone la perdida de tesoros 'ARMOR', tanto visibles como ocultos: \n\n"

for iterador in monsters
  primero = TreasureKind
  segundo = TreasureKind
  auxVisibles = iterador.malRollo.specificVisibleTreasures
  auxOcultos = iterador.malRollo.specificHiddenTreasures
  
  for primero in auxVisibles
    if("ARMOR".equal?(primero.to_s)) then
        puts iterador.to_s
        puts "\n"
    end
  end
  for segundo in auxOcultos
    if ("ARMOR".equal?(segundo.to_s)) then
        puts iterador.to_s
        puts "\n"
    end
  end
end