class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @lesson_count = Lesson.count
    @testimonial_count = Testimonial.count
    @user_count = User.count
  end

  private

  def authorize_admin!
    unless current_user&.admin?
      sign_out current_user
      redirect_to root_path, alert: "Acesso negado! Você precisa ser um administrador."
    end
  end
end
