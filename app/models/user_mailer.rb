class UserMailer < ActionMailer::Base
  

  def confirm(user, password)
    subject    'Registration Confirmation'
    recipients user.email
    from       'admin@nickolay-laptop'
    sent_on    Time.now
    
    body       :user => user, :token => User.activation_code(user), :password => password
  end

end
