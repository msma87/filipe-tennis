class Admin::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @lessons = Lesson.all.order(created_at: :desc)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admin_lessons_path, notice: "Aula cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to admin_lessons_path, notice: "Aula atualizada!"
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to admin_lessons_path, notice: "Aula removida!"
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :price, :duration)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado!" unless current_user.admin?
  end
end
