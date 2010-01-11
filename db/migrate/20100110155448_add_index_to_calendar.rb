class AddIndexToCalendar < ActiveRecord::Migration
  def self.up
    add_index :calendars, :event_id
  end

  def self.down
    remove_index :calendars, :event_ids
  end
end
