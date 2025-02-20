class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      if get?
        display_error
      elsif has_errors?
        render_error
      else
        redirect_to navigation_location
      end
    end

    private

    def display_error
      controller.render(options.merge(formats: :html))
    end

    def render_error
      controller.render rendering_options.merge(
        formats: :html,
        status: :unprocessable_entity
      )
    end

    def navigation_location
      options[:location] || controller.respond_to?(:root_path, true) ? controller.root_path : "/"
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream

  protected

  def respond_with(*resources, &block)
    if action_name == 'destroy'
      redirect_to after_sign_out_path_for(:user), allow_other_host: true
    else
      super(*resources) do |format|
        format.turbo_stream { redirect_to after_sign_in_path_for(resources.first) }
        block&.call(format)
      end
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.admin?
        admin_root_path
      else
        root_path
      end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
