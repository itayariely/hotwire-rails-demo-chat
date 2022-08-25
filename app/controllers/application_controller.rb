class ApplicationController < ActionController::Base
    # before_action :get_session
     helper_method :current_user 
    before_action :allow_iframe_requests

  def allow_iframe_requests
    embedding_url = "*"
    response.set_header('Access-Control-Allow-Origin', '*')
    response.set_header("X-Frame-Options", "ALLOW-FROM #{embedding_url}")
    response.set_header("Content-Security-Policy", "frame-ancestors 'self' #{embedding_url}")
  end

 private

    def current_user
        session[:user_id] ||= User.find_by(email:params[:email]).id  if params[:email].present?
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def get_session
        session[:user_id] ||= User.find_by(email:params[:email]).id  if params[:email].present?
    end
end
