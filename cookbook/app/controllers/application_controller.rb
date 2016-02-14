class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_title
  before_action :set_categories
  
  def set_title
    @title = "Cookbook"
  end
  
  def set_categories
    @allcategories = Category.all
  end
  
  helper_method :logged_in?, :current_user
  #helper_method :current_user
  
  def logged_in?
    session[:logged_in]
  end
  
  private 
  
    def authenticate
      # authenticate_or_request_with_http_basic do |user_name, password|
      #   session[:logged_in] = (user_name == 'admin' && password == 'password')
      # end
      if user = authenticate_with_http_basic {|username, password| User.authenticate(username, password)}
        session[:user_id] = user.id
        session[:logged_in] = true
      else
        request_http_basic_authentication
      end
    end
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:logged_in]
    end
end
