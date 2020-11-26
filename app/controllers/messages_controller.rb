class MessagesController < ApplicationController

    def create
        user = User.all.find(params[:id])
        message = user.messages.new(message_params)
        if message.save
            redirect_to getMessages_path(message.emisor_id, message.user_id)
        else
            redirect_to '/home', notice: 'Message was not sended.' 
        end
    end

    def show
        followUsers = User.find(params[:id1]).following
        @myUsers = []
        followUsers.each do |user|
            user.following.each do |user2|
              if current_user=user2
                  @myUsers.push(user)
              end
            end
        end
        if(params[:id2])
            @selectedUser = User.find(params[:id2])
            @ourMessages = Message.where(user_id: @selectedUser.id, emisor_id: current_user.id)
            @ourMessages.order('created_at desc')
        end
        render '/user/Messages'
    end


    def message_params
        params.require(:message).permit(:text, :image, :user_id, :user_name, :emisor_id)
      end
end