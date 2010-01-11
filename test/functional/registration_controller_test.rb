require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase

  fixtures :users

  def setup
    @controller = RegistrationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @emails     = ActionMailer::Base.deliveries
    @emails.clear
  end
  
  def test_activation_user
    create_new_user.save

    get (:activation, 
      :user_id => @user.id, 
      :token   => User.activation_code(@user))
      
    assert @old_user = User.find_by_id(@user.id)
    assert @old_user.reg
  end
  
  def test_registration_get
    get :singlein
    
    assert_response :success
    assert_template "singlein"
    assert_equal flash[:notice], "Введите данные для регистрации"
  end
  
  def test_registration_user_post
    @user = create_new_user
    
    post (:singlein,
      :user => {
        :name                  => @user.name, 
        :password              => @user.password,
        :password_confirmation => @user.password,
        :email                 => @user.email})
      
    assert_response :success
    assert_equal(
      flash[:notice], (
        "Пользователь " + 
        @user.name +
        " успешно зарегистрирован.<br/>К вам на почту " +
        @user.email + 
        " отправленно письмо!"
    ))
    assert_equal 1, @emails.size
    assert_equal @emails.first.to[0], @user.email
    assert !@user.reg?
  end
  
protected 

  def create_new_user
    @password      = "test-password"
    
    @user          = User.new
    @user.name     = "testUser"
    @user.password = @password
    @user.email    = "test@test.test"
    @user.salt     = "salt"
    @user
  end
end
