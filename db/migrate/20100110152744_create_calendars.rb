class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.integer :minute
      t.integer :hour
      t.integer :day_of_month
      t.integer :month
      t.integer :day_of_week

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
