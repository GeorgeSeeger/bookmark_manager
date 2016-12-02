require 'bcrypt'

class User


  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password_hash, Text
  attr_accessor :password_confirm
  validates_confirmation_of :password_hash, confirm: :password_confirm

  @@user_count = 0

  def initialize params
    self.password = params[:password]
    self.email = params[:email]
    self.password_confirm = params[:password_confirm]
    @@user_count += 1
  end

  def password= password
    self.password_hash= BCrypt::Password.create(password)
  end

  def self.user_count
    @@user_count
  end



end
