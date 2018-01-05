class AddWaitlistedToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :waitlisted, :boolean
  end
end
