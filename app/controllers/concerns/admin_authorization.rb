module AdminAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :require_admin
  end

  private

  def require_admin
    unless current_user&.admin?
      flash[:error] = "Você não tem permissão para acessar esta área."
      redirect_to root_path
    end
  end
end
