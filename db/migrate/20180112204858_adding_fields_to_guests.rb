class AddingFieldsToGuests < ActiveRecord::Migration
  def change
    remove_column :guests, :first_name
    remove_column :guests, :last_name
    remove_column :guests, :rank
    remove_column :guests, :waitlisted
    remove_column :guests, :attending
    remove_column :guests, :company_name
    remove_column :guests, :broker
    remove_column :guests, :c21_company

    add_column :guests, :name, :string
    add_column :guests, :phone, :string
    add_column :guests, :conference, :boolean
    add_column :guests, :dinner, :boolean

  end
end
