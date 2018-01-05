class AddAttendingToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :attending, :boolean
  end
end
