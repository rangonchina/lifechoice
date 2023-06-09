class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    
  def after_sign_in_path_for(resource)
    
    if resource.is_a?(User)
      # ユーザーのとき
       root_path
    elsif resource.is_a?(Admin)
      # 管理者のとき
       admin_themes_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :gender, :age])
  
  end
end
