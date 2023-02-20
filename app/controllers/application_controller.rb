class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
  #sing in後のページの設定
  def after_sign_in_path_for(resource)
    post_images_path #名前付きルート
  end
  
  #sing out後のページの設定
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end