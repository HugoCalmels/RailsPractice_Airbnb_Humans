class AddListingToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :listing, foreign_key: true
  end
end
