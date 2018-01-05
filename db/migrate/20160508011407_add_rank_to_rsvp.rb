class AddRankToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :rank, :string
  end
end
