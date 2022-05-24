class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   if
    current_user
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id) # ログイン後に遷移するpathを設定
   else
     flash[:notice] = "Sign up successfully."
      user_path(current_user.id)
   end
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
