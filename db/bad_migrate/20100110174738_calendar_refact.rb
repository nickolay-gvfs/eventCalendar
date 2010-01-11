class CalendarRefact < ActiveRecord::Migration
  def self.up
    add_column :calendars, :value, :datetime
    remove_column :calendars, :minute
    remove_column :calendars, :hour
    remove_column :calendars, :day_of_month
    remove_column :calendars, :month
    remove_column :calendars, :day_of_week
  end

  def self.down
      add_column :calendars, :minute, :integer
      add_column :calendars, :hour, :integer
      add_column :calendars, :day_of_month, :integer
      add_column :calendars, :month, :integer
      add_column :calendars, :day_of_week, :integer
      remove_column :calendars, :value
  end
end
