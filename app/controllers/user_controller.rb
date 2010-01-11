class UserController < ApplicationController
  
  layout "index_without_calendar"
  
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index", :controller => "calendar")
      else
        flash.now[:notice] = "Введенны не верные данные либо аккаунт не активен"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out " + session[:user_id].to_s
    redirect_to(:action => "login")
  end

end
