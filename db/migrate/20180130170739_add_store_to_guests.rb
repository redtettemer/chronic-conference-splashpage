class AddStoreToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :store, :string
  end
end
