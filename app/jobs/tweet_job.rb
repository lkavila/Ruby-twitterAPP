class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet_params,user)
    @tweet = user.tweets.new(tweet_params)
    @tweet.save
  end
end
