class ApplicationController < ActionController::Base
#全部にかかる
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!, if: use_before_action?#これに書いたら全部に反映されてしまう

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:name, :email, :password, :password_confirmation)
    }

    # devise_parameter_sanitizer.permit(:sign_in){|u|
    #   u.permit(:user_id, :password, :remember_me)
    # }
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:name, :password, :password_confirmati)}
  end
  #def configure_permitted_parameters
   #devise_parameter_sanitizer.permit(:sign_up, keys: [:name])#これnameかも
   #devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   #devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  #end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end