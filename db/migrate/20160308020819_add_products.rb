class AddProducts < ActiveRecord::Migration
  def change
  	Product.create :title => 'Spicy pizza', :descrition => 'This is very spizy pizza', :price => 500, :size => 30, :is_spicy => true, :is_veg => false, :is_best_offer => true, :path_to_image => '/images/spice.jpg'
  	Product.create :title => 'Pepperoni', :descrition => 'Nice and tasty pizza', :price => 700, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/pipperoni.JPG'
  	Product.create :title => 'Vegetarian', :descrition => 'This is best and amazing pizza', :price => 300, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => false, :path_to_image => '/images/veger.jpg'
  end
end