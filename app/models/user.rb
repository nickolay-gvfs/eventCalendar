
require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of     :name
  validates_uniqueness_of   :name
 
  attr_accessor :password_confirmation, :reg
  validates_confirmation_of :password

  validate :password_non_blank
  
  #validate :valid_email?
  validates_format_of :email,
   :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  def self.activation_code(user)
    return Digest::SHA1.hexdigest(user.name + user.hashed_password)
  end
  
  def self.activation(user_id, code)
    user = self.find_by_id(user_id)
    if user
      if self.activation_code(user) == code
        user.reg = true
        user.save
        return user
      end
    end
    return false
  end
  
  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      else
        if ! user.reg?
          user = nil
        end
      end
    end
    user
  end
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

private
  
  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(password, salt = "defaultSalt")
    string_to_hash = password + "_salt_" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def valid_email?
    TMail::Address.parse(email)
    rescue
      errors.add(:email, "Must be a valid email")
  end
  
end