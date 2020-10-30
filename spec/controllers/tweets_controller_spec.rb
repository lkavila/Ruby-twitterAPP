require 'rails_helper'

RSpec.describe TweetsController, "#create" do
    context "When a tweet is created with invalid params" do
        it "Should re-render the tweet form" do
            expect {Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
        end
        
    end
  end