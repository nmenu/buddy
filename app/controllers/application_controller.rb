class ApplicationController < ActionController::Base
  before_action :authenticate_user!

    # [...]
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

      # For additional in app/views/devise/registrations/edit.html.erb
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street, :city, :npa])
    end

end



# if @user.save
#   redirect_to root_path()
# else
#   flash[:alert] = @booking.errors.full_messages.join("\n")
#   render :new, status: :unprocessable_entity # message d'erreur
# end
