require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "confirm" do
    @password         = "testUserPassword"
    @user             = User.new
    @user.name        = "testUserName"
    @user.password    = @password
    @user.email       = "test@test.test"
    @user.save
    
    @expected.subject = "Registration Confirmation"
    #@expected.body    = read_fixture('confirm')
    #@expected.date    = Time.now
    response          = UserMailer.create_confirm(@user, @password)
    
    assert_equal @expected.subject, response.subject
    assert_equal @user.email, response.to[0]
    #assert_equal @expected.encoded, UserMailer.create_confirm(@user, @password).encoded
  end

end
