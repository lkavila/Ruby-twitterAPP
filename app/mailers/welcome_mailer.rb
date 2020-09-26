class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Bienvenido a Twitter", from:"zittwocar@gamil.com" 
    end

end
