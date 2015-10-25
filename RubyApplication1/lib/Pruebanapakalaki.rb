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
#3 Byakhees de bonanza
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
monsters << Monster.new("3 Byakhees de bonanza",8,prize,badConsequence)

#Chibithulhu
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible", 0, [TreasureKind::HELMET])
monsters << Monster.new("Chibithulhu",2,prize,badConsequence)

#El sopor de Dunwich
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes el calzado visible", 0, [TreasureKind::SHOES])
monsters << Monster.new("El sopor de Dunwich",2,prize,badConsequence)

#Ángeles de la noche ibicenca
prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
monsters<< Monster.new("Angeles de la noche ibicenca", 14, prize, badConsequence)

#El gorron en el umbral
prize = Prize.new(3,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes todos tus tesoros visibles", 0, 5)
monsters<< Monster.new("El gorron en el umbral", 10, prize, badConsequence)

#H.P. Munchcraft
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible", 0, [TreasureKind::ARMOR])
monsters << Monster.new("H.P. Munchcraft",6,prize,badConsequence)

#Bichgooth
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, [TreasureKind::ARMOR])
monsters << Monster.new("Bichgooth",2,prize,badConsequence)

#El rey de la rosa
prize = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",5 , 3, 0)
monsters << Monster.new("El rey de rosa",13,prize,badConsequence)

#La que redacta en las tinieblas
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
monsters << Monster.new("La que redacta en las tinieblas",2,prize,badConsequence) 

#Los hondos
prize = Prize.new(2,1)
badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superciales y te aburren mortalmente. Estas muerto")
monsters << Monster.new("Los hondos",8,prize,badConsequence)

#Semillas Cthulhu
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.",2 , 0, 2)
monsters << Monster.new("Semillas Cthulhu",4,prize,badConsequence)

#Dameargo
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.", 0, [TreasureKind::ONEHAND])
monsters << Monster.new("Dameargo",1,prize,badConsequence)

#Pollipolipo volante
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.",3 , 0, 0)
monsters << Monster.new("Pollip olipo volate",3,prize,badConsequence)

#Yskhtihyssg-Goth
prize = Prize.new(3,1)
badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto")
monsters << Monster.new("Yskhtihyssg-Goth",12,prize,badConsequence)

#Familia feliz
prize = Prize.new(4,1)
badConsequence = BadConsequence.newDeath("La familia te atrapa. Estas muerto.")
monsters << Monster.new("Familia feliz",1,prize,badConsequence)

#Roboggoth
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, 2, 0)
monsters << Monster.new("Roboggoth",8,prize,badConsequence)

#El espia
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET])
monsters << Monster.new("El espia",5,prize,badConsequence)

#El Lenguas
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
monsters << Monster.new("El lenguas",20,prize,badConsequence)

#Bicefalo
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, 5, 0)
monsters << Monster.new("Bicefalo",20,prize,badConsequence)


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