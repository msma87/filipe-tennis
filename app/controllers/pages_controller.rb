class PagesController < ApplicationController
  def home
    @testimonials = Testimonial.order(created_at: :desc).limit(3)
  end

  def about
  end

  def lessons
  end

  def contact
  end

  # Método para processar o envio do formulário
  # def send_message
  #   name = params[:name]
  #   phonenumber = params[:phonenumber]
  #   message = params[:message]

  #   # Simulação de envio de e-mail (pode ser substituído por um mailer)
  #   flash[:notice] = "Obrigado, #{name}! Sua mensagem foi enviada com sucesso."

  #   redirect_to contact_path
  # end
end
