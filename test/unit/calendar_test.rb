require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  fixtures :calendars
  fixtures :events
  
  def test_get_events
    startDate = 1261861200
    endDate   = 1265490000
    events    = Calendar.get_events(startDate, endDate)
    assert_equal(14, events.count)
  end

end
