class ApplicationController < ActionController::Base
   # before_action :set_user, only: [:profile]
    def index
        if user_signed_in?
            userIsloging()
        else
            render '/index'
        end
    end

    def login
        if user_signed_in?
            userIsloging()
        else
            render '/user/Login'
        end
    end

    def home
        if user_signed_in?
            userIsloging()
        else
            redirect_to '/'
        end
    end

    def profile
        @user = User.find(params[:user])
        render '/user/profile'
    end
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :birth, :email, :password, :password_confirmation) }
    end

    def userIsloging
            @tweet = Tweet.new
            @tweets = Tweet.where user_id: current_user.id
            @users = User.all
            render '/home'
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
