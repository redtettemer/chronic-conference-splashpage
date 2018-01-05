class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :rank
      t.boolean :waitlisted
      t.boolean :attending

      t.timestamps null: false
    end
  end
end
