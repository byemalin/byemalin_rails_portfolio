class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add a method in the User model
  def is_admin?
    self.email == 'malin@byemalin.com'  # Replace with your admin email
  end

end
