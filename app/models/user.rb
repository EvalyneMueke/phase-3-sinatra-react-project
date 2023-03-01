require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tasks

  # Hash passwords with bcrypt before saving to database
  before_save :hash_password

  # Verify password using bcrypt
  def verify_password(password)
    BCrypt::Password.new(self.password) == password
  end

  private

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end
end
