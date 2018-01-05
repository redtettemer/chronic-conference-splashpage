class RemoveAttendingFromRsvp < ActiveRecord::Migration
  def change
    remove_column :rsvps, :attending
  end
end
