class DropRsvp < ActiveRecord::Migration
  def change
    drop_table :rsvps
  end
end
