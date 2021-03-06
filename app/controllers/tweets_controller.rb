class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.where user_id: current_user.id
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json

  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to '/home', notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: '/home' }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to '/home', notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like 
    @tweet = Tweet.all.find(params[:id])
    Like.create(user_id: current_user.id, tweet_id: @tweet.id)
    redirect_to '/home'
  end

  def dislike
    Like.destroy_by(user_id: current_user.id, tweet_id: params[:id])
    redirect_to '/home'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:text, :image, :user_id, :user_name)
    end
end
