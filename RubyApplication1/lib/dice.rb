# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"

class Dice
  include Singleton
    
    def Dice()
      
    end
    private :Dice
    
    def getInstance()
      instance = Dice.instance
    end
    #Genera un número aleatorio entre 1 y 6
    def nextNumber
       return 1 + rand(6)
    end
end

