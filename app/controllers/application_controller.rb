class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top, :about, :theme_index, :all_index]
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :gender, :age])
  
  end
end
