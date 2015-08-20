class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # rescue_from CanCan::AccessDenied, with: :access_deniedxxx
 #
 # def access_deniedxxx
 #     redirect_to Rails.application.routes.url_helpers.root_path, :alert => exception.message
 # end


 rescue_from CanCan::AccessDenied do |exception|
     redirect_to Rails.application.routes.url_helpers.root_path, :alert => exception.message
   end



end
