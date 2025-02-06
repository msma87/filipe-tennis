class Admin::TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]

  def index
    @testimonials = Testimonial.all
  end

  def show
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)

    if @testimonial.save
      redirect_to admin_testimonials_path, notice: "Depoimento criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @testimonial.update(testimonial_params)
      redirect_to admin_testimonials_path, notice: "Depoimento atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @testimonial.destroy
    redirect_to admin_testimonials_path, notice: "Depoimento excluído com sucesso."
  end

  private

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:name, :content, :photo)
  end
end
