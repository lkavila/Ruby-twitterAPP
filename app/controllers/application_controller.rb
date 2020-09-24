class ApplicationController < ActionController::Base
    def index
        render '/index'
    end

    def login 
        render '/user/Login'
    end
end
