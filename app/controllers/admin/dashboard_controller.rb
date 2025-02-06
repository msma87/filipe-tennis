class Admin::DashboardController < ApplicationController
  before_action :authenticate_user! # Restringe a usuários logados
  before_action :authorize_admin!   # Restringe a administradores

  def index
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado!" unless current_user.admin?
  end
end
