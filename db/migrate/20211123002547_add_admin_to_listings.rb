class AddAdminToListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :user, foreign_key: true
    add_reference :listings, :admin, foreign_key: { to_table: :users }
  end
end
