class RefactoringCalendar < ActiveRecord::Migration
  def self.up
    add_column :calendars, :unixtimestamp, :integer
    remove_column :calendars, :day_of_month
    remove_column :calendars, :month
  end

  def self.down
    remove_column :calendars, :unixtimestamp 
    add_column :calendars, :day_of_month, :integer
    add_column :calendars, :month, :integer
  end
end
