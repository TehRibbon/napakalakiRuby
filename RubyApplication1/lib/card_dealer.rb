# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure_kind.rb'
require_relative 'monster.rb'
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
require_relative 'cultist.rb'
require_relative 'specific_bad_consequence.rb'
require_relative 'numeric_bad_consequence.rb'
require_relative 'death_bad_consequence.rb'
require "singleton"


class CardDealer
    #Patron singleton
    include Singleton
    
    #Atributos
    attr_accessor :usedMonsters, :unusedMonsters, :usedCultists, :unusedCultists, :usedTreasures, :unusedTreasures
    
    
    def initialize
    end
    private :initialize
    
    #Inicializa el mazo de cartas de Tesoros (unusedTreasures) con todas las cartas de
    #tesoros proporcionadas en el documento de cartas de tesoros.
    def initTreasureCardDeck
        @unusedTreasures = Array.new  #Inicializamos los dos arrays de Tesoros
        @usedTreasures = Array.new
        
        @unusedTreasures << Treasure.new("Si mi amo", 4, TreasureKind::HELMET);
        @unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES );
        @unusedTreasures << Treasure.new("Capucha de Cthulhu",3, TreasureKind::HELMET );
        @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR );
        @unusedTreasures << Treasure.new("Botas de lluvia acida",1, TreasureKind::BOTHHANDS );
        @unusedTreasures << Treasure.new("Casco minero",2,TreasureKind::HELMET);
        @unusedTreasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Camiseta de la UGR",1, TreasureKind::ARMOR);
        @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Cuchillo de sushi arcano",2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET);
        @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("El aparato de Pr. Tesla", 4, TreasureKind::ARMOR);
        @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR);
        @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Necro-comicon", 1, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS);
        @unusedTreasures << Treasure.new("Necro-gnomicon", 2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET);
        @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Necro-playboycon", 3, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS);    
        @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND);
        @unusedTreasures << Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET);
        @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES);
    end
    private :initTreasureCardDeck
    
    #Inicializa el mazo de cartas de monstruos (unusedMonsters), con todas las cartas
    #de monstruos proporcionadas en el documento de cartas de monstruos. Se
    #recomienda reutilizar el código desarrollado en la primera práctica para construir
    #las cartas de monstruos. Usa el atributo de clase definido en la clase
    #BadConsequence MAXTREASURES para los monstruos cuyo mal rollo sea
    #pérdida de todos los tesoros visibles u ocultos.
    def initMonstersCardDeck
      
        #DEFINICION MAZO CARTAS
        @unusedMonsters = Array.new #Inicializamos los dos arrays de monstruos
        @usedMonsters = Array.new 
        
        #3 Byakhees de bonanza
        prize = Prize.new(2,1)
        badConsequence = SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
        @unusedMonsters << Monster.new("3 Byakhees de bonanza",8,prize,badConsequence)

        #Chibithulhu
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible",0,[TreasureKind::HELMET],[])
        @unusedMonsters << Monster.new("Chibithulhu",2,prize,badConsequence)

        #El sopor de Dunwich
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes el calzado visible", 0,[TreasureKind::SHOES],[])
        @unusedMonsters << Monster.new("El sopor de Dunwich",2,prize,badConsequence)

        #Ángeles de la noche ibicenca
        prize = Prize.new(4,1)
        badConsequence = SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
        @unusedMonsters << Monster.new("Angeles de la noche ibicenca", 14, prize, badConsequence)

        #El gorron en el umbral
        prize = Prize.new(3,1)
        badConsequence = NumericBadConsequence.new("Pierdes todos tus tesoros visibles", 0, badConsequence.getMAXTREASURES, 0)
        @unusedMonsters << Monster.new("El gorron en el umbral", 10, prize, badConsequence)

        #H.P. Munchcraft
        prize = Prize.new(2,1)
        badConsequence = SpecificBadConsequence.new("Pierdes la armadura visible", 0, [TreasureKind::ARMOR],[])
        @unusedMonsters << Monster.new("H.P. Munchcraft",6,prize,badConsequence)

        #Bichgooth
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, [TreasureKind::ARMOR], [])
        @unusedMonsters << Monster.new("Bichgooth",2,prize,badConsequence)

        #El rey de la rosa
        prize = Prize.new(4,2)
        badConsequence = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles",5 , 3, 0)
        @unusedMonsters << Monster.new("El rey de rosa",13,prize,badConsequence)

        #La que redacta en las tinieblas
        prize = Prize.new(1,1)
        badConsequence = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
        @unusedMonsters << Monster.new("La que redacta en las tinieblas",2,prize,badConsequence) 

        #Los hondos
        prize = Prize.new(2,1)
        badConsequence = DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
        @unusedMonsters << Monster.new("Los hondos",8,prize,badConsequence)

        #Semillas Cthulhu
        prize = Prize.new(2,1)
        badConsequence = NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos.",2 , 0, 2)
        @unusedMonsters << Monster.new("Semillas Cthulhu",4,prize,badConsequence)

        #Dameargo
        prize = Prize.new(2,1)
        badConsequence = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible.", 0, [TreasureKind::ONEHAND],[])
        @unusedMonsters << Monster.new("Dameargo",1,prize,badConsequence)

        #Pollipolipo volante
        prize = Prize.new(1,1)
        badConsequence = NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles.",3 , 0, 0)
        @unusedMonsters << Monster.new("Pollipolipo volate",3,prize,badConsequence)

        #Yskhtihyssg-Goth
        prize = Prize.new(3,1)
        badConsequence = DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto")
        @unusedMonsters << Monster.new("Yskhtihyssg-Goth",12,prize,badConsequence)

        #Familia feliz
        prize = Prize.new(4,1)
        badConsequence = DeathBadConsequence.new("La familia te atrapa. Estas muerto.")
        @unusedMonsters << Monster.new("Familia feliz",1,prize,badConsequence)

        #Roboggoth
        prize = Prize.new(2,1)
        badConsequence = SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, [TreasureKind::BOTHHANDS], [])
        @unusedMonsters << Monster.new("Roboggoth",8,prize,badConsequence)

        #El espia
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET],[])
        @unusedMonsters << Monster.new("El espia",5,prize,badConsequence)

        #El Lenguas
        prize = Prize.new(1,1)
        badConsequence = NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
        @unusedMonsters << Monster.new("El lenguas",20,prize,badConsequence)

        #Bicefalo
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3,[TreasureKind::BOTHHANDS,TreasureKind::ONEHAND], [])
        @unusedMonsters << Monster.new("Bicefalo",20,prize,badConsequence)
         
        #El mal indecible impronunciable
        prize = Prize.new(3,1)
        badConsequence = NumericBadConsequence.new("Pierdes 1 mano visible.", 0,1,0)
        @unusedMonsters << Monster.new("El mal indecible impronunciable",10,prize,badConsequence,-2)
        
        #Testigos Oculares
        prize = Prize.new(2,1)
        badConsequence = NumericBadConsequence.new("Pierdes tus tesoros visibles. Ja ja ja.", 0,4,0)
        @unusedMonsters << Monster.new("Testigos Oculares",6,prize,badConsequence,2)
        
        #El gran ctulhu
        prize = Prize.new(2,5)
        badConsequence = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres.")
        @unusedMonsters << Monster.new("El gran ctulhu",20,prize,badConsequence,4)
        
        #Serpiente politico
        prize = Prize.new(2,1)
        badConsequence = NumericBadConsequence.new("Tu gobierno te recorta 2 niveles.", 2,0,0)
        @unusedMonsters << Monster.new("Serpiente politico",8,prize,badConsequence,-2)
        
        #Felpuggoth
        prize = Prize.new(1,1)
        badConsequence = SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas.", 0,[TreasureKind::ARMOR,TreasureKind::HELMET],[TreasureKind::BOTHHANDS,TreasureKind::ONEHAND])
        @unusedMonsters << Monster.new("Felpuggoth",2,prize,badConsequence,5)
        
        #Shoggoth
        prize = Prize.new(4,2)
        badConsequence = NumericBadConsequence.new("Pierdes 2 niveles.", 2,0,0)
        @unusedMonsters << Monster.new("Shoggoth.",16,prize,badConsequence,-4)
        
        #Lolitagooth
        prize = Prize.new(1,1)
        badConsequence = NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles.", 2,0,0)
        @unusedMonsters << Monster.new("Lolitagooth",2,prize,badConsequence,3)
    end
    private :initMonstersCardDeck
    
    def initCultistCardDeck
        @unusedCultists = Array.new
        @usedCultists = Array.new
        
        @unusedCultists << Cultist.new("Sectario",1)
        @unusedCultists << Cultist.new("Sectario",2)
        @unusedCultists << Cultist.new("Sectario",1)
        @unusedCultists << Cultist.new("Sectario",2)
        @unusedCultists << Cultist.new("Sectario",1)
        @unusedCultists << Cultist.new("Sectario",1)
        
    end
    private :initCultistCardDeck
    
    def shuffleTreasures
      @unusedTreasures = @unusedTreasures.shuffle
      
    end
    private :shuffleTreasures
    
    def shuffleMonsters
      @unusedMonsters = @unusedMonsters.shuffle
    end
    private :shuffleMonsters
    
    def shuffleCultists
      @unusedTreasures = @unusedTreasures.shuffle
    end
    private :shuffleCultists
    
    def getInstance
      instance = CardDealer.instance
    end
    
    def nextTreasure
    
      #Comprobamos si tenemos cartas en el mazo
      if @unusedTreasures.empty?
            
        #Recorremos las cartas descartadas
        @usedTreasures.each do |t| 
                
          #Las agregamos al mazo sin usar
          @unusedTreasures << t
        
        end
            
        #Las barajamos
        shuffleTreasures
            
        #Limpiamos el mazo de descartes
        @usedTreasures.clear
        
      end
        
      #Obtengo la primera carta del mazo
      siguiente_tesoro = @unusedTreasures.at(0)
        
      #La agregamos al mazo de descartes
      @usedTreasures << siguiente_tesoro
        
      #La eliminamos del mazo
      @unusedTreasures.delete(siguiente_tesoro);
        
      #Devolvemos la carta
      return siguiente_tesoro
        
    end
    
    def nextMonster
      
      #Comprobamos si tenemos cartas en el mazo
      if (@unusedMonsters.empty?) then
            
        #Recorremos las cartas descartadas
        @usedMonsters.each do |m| 
                
          #Las agregamos al mazo sin usar
          @unusedMonsters << m
        
        end
            
        #Las barajamos
        shuffleMonsters
            
        #Limpiamos el mazo de descartes
        @usedTreasures.clear
        
      end
        
      #Obtengo la primera carta del mazo
      m = @unusedMonsters.at(0)
        
      #La agregamos al mazo de descartes
      @usedMonsters << m
        
      #La eliminamos del mazo
      @unusedMonsters.delete(m);
        
      #Devolvemos la carta
      return m
    end
    
    def nextCultist
      #Comprobamos si tenemos cartas en el mazo
      if (@unusedCultists.empty?) then
            
        #Recorremos las cartas descartadas
        @usedCultists.each do |c| 
                
          #Las agregamos al mazo sin usar
          @unusedCultists << c
        
        end
            
        #Las barajamos
        shuffleCultists
            
        #Limpiamos el mazo de descartes
        @usedCultists.clear
        
      end
        
      #Obtengo la primera carta del mazo
      c = @unusedCultists.at(0)
        
      #La agregamos al mazo de descartes
      @usedCultists << c
        
      #La eliminamos del mazo
      @unusedCultists.delete(c);
        
      #Devolvemos la carta
      return c
    end
    #Introduce en el mazo de descartes de tesoros (usedTreasures) el tesoro t.
    def giveTreasureBack(treasure)
      @usedTreasures << treasure #inicializado en initTreasureCard
    end
    
    def giveMonsterBack(monster)
      @usedMonsters << monster #inicializado en initMonster
    end
    
    def initCards
      initTreasureCardDeck
      shuffleTreasures
      
      initMonstersCardDeck
      shuffleMonsters
      
      initCultistCardDeck
      shuffleCultists
    end
    
  
end


