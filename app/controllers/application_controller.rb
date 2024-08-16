class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_options
  
  def set_search_options
    @search_options = ['ユーザー', '投稿']
  end  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname])
  end
end
