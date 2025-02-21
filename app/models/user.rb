class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :timeoutable,
         :lockable

  # Define if user is administrator
  def admin?
    self[:admin] == true
  end
end
