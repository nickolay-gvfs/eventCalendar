# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'index_without_calendar'
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :authorize, :except => [:login, :view, :singlein]

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  # protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'
  
protected

  def authorize
    user = User.find_by_id(session[:user_id].to_i)
    if ! user
      flash[:notice] = "Please log in"
      redirect_to :controller => 'user', :action => 'login'
    end
  end
  
end
