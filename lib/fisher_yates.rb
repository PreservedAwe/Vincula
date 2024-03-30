# lib/fisher_yates.rb
module FisherYates
    def self.shuffle(array)
       n = array.length
       while n > 0
         x = rand(n -= 1)
         array[x], array[n] = array[n], array[x]
       end
       array
    end
   end
   