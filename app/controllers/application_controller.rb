class ApplicationController < ActionController::Base
    def index
        render '/index'
    end

    def login 
        render '/user/Login'
    end

    def home
        @tweet = Tweet.new
        @tweets = Tweet.all
        render '/home'
    end
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :birth, :email, :password, :password_confirmation) }
    end
end
