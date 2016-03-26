class Car < ActiveRecord::Base
   def self.by_model
     order(:model)
   end

   def self.by_make
     order(:make)
   end

   def self.by_price(high = false)
     if high
       order(price: :desc)
     else
       order(:price)
     end
   end

   def info
     {make: self.make, model: self.model, price: self.price, interior: self.interior}
   end

   def honk
     "Beep"
   end

end
