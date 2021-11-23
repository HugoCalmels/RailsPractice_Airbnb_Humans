class AddCityToListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :city, foreign_key: true
  end
end
