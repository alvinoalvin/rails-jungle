class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true
   
  def authenticate_with_credentials (email,password) 
    user = User.where("lower(email) = ?", email.downcase).first

    if user != nil && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
