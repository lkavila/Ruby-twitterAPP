class RelationshipsController < ApplicationController
   
    def create
      @user = User.find(params[:followed_id])
      current_user.follow(@user)
      
      redirect_to :controller => "application", :action => "profile", :user => @user
    end
   
    def destroy
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow(@user)
      redirect_to :controller => "application", :action => "profile", :user => @user
    end

    def listFollowing
      @FollowUsers = User.find(params[:user]).following
      render '/user/listFollow'
    end

    def listFollowers
      @FollowUsers = User.find(params[:user]).followers
      render '/user/listFollow'
    end
end
