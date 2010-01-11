class AddEventLinkToCalendar < ActiveRecord::Migration
  def self.up
    add_column :calendars, :event_id, :integer
  end

  def self.down
    remove_column :calendars, :event_id
  end
end
