require 'rubygems'

require 'active_support'

class CalendarController < ApplicationController
  
  layout "index_with_calendar"

  def index
    
  end
  
  def view
    
  end
  
  def get

    @events = Calendar.get_events(params[:start].to_i, params[:end].to_i)
    
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :text => @events.to_json
  end
  
end
