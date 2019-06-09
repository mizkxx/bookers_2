class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])#これnameかも
   devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  #def set_current_user #これネットから引っ張ってきた	
  #@current_user = User.find_by(id: session[:user_id])
  #end
  before_action :authenticate_user!
  #これって3行目と共存してていいんかな

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end