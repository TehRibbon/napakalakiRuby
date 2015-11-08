# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"
require_relative "treasure"
require_relative "monster"

class CardDealer
    #Patron singleton
    include Singleton
    
    #Atributos
    attr_accessor :usedMonsters, :unusedMonsters, :usedTreasures, :unusedTreasures
    
    def initialize.CardDealer
     
    end
    
    #Inicializa el mazo de cartas de Tesoros (unusedTreasures) con todas las cartas de
    #tesoros proporcionadas en el documento de cartas de tesoros.
    def initTreasureCardDeck
      
    end
    
    def initMonstersCardDeck
      
    end
    
    def shuffleTreasures
      
    end
    
    def shuffleMonsters
      
    end
    
    def getInstance
      instance = CardDealer.instance
    end
    
    def NextTreasure
      
    end
    
    def NextMonster
      
    end
    
    def giveTreasureBack(treasure)
      
    end
    
    def giveMonsterBack(monster)
      
    end
    
    def initCards
      
    end
    
  
end
