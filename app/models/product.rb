class Product < ActiveRecord::Base

  before_create :assign_random_price



  def assign_random_price
    # invent a random price from $49 to $399
    # and then convert to cents
    self.price ||= rand(49..399) * 100
  end
  
end
