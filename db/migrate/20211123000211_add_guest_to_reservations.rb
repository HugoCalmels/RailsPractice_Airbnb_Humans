class AddGuestToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :guest, foreign_key: { to_table: :users }
  end
end
