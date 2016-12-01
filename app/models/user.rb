require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id,             Serial
  property :email,          String
  property :password_hash,  Text

  @@count = 0

  def initialize email: , password:
    self.password = password
    self.email = email
    @@count += 1
  end

  def self.count
    @@count
  end

  def password=(password)
    @password_hash = Password.create(password)
  end
end
