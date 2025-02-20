# Configure Devise to work with Turbo
class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w(html turbo_stream */*).include? request_format.to_s
  end
end

# Configure Devise to work with Turbo
Devise.setup do |config|
  # Add support for turbo_stream format
  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # Use our custom failure app
  config.warden do |manager|
    manager.failure_app = TurboFailureApp
  end

  # Set parent controller
  config.parent_controller = 'TurboDeviseController'
end

# Override Devise's sign_out_via to accept both :delete and :get methods
Rails.application.config.to_prepare do
  Devise::SessionsController.class_eval do
    def verify_signed_out_user
      if all_signed_out?
        set_flash_message! :notice, :already_signed_out
        respond_to_on_destroy
      end
    end
  end
end
