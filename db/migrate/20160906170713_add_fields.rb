class AddFields < ActiveRecord::Migration
  def change
    add_column :guests, :company_name, :string
    add_column :guests, :c21_company, :string
    add_column :guests, :broker, :string
  end
end
