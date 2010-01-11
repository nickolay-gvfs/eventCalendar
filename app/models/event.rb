class Event < ActiveRecord::Base
  has_many :calendars
end
