class RegistrationController < ApplicationController
  
  layout "index_without_calendar"
  
  def singlein
    @user         = User.new(params[:user])

    if request.post? and @user.save
      flash.now[:notice] = "Пользователь #{@user.name} успешно зарегистрирован."
      
      if UserMailer.deliver_confirm @user, params[:user][:password]
        flash.now[:notice] += "<br/>К вам на почту #{@user.email} отправленно письмо!"
        render :action => 'complete'
      else
        flash.now[:notice] += "<br/>Письмо не удалось отправить!"
        @user.reg = true
        @user.save()
      end
      
      @user = User.new
    else
      flash.now[:notice] = "Введите данные для регистрации"
    end
    
  end
  
  def activation
    @user = User.activation(params[:user_id], params[:token])
    if @user
      flash.now[:notice] = "Запись пользователя #{@user.name} успешно активированна!"
    else
      flash.now[:notice] = "Ваш аккаунт не подтвержден!"
    end
  end
end
