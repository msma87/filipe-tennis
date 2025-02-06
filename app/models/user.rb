class User < ApplicationRecord
  # Adiciona autenticação do Devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Define se o usuário é administrador
  def admin?
    self.role == "admin"
  end
end
