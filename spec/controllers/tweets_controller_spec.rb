require 'rails_helper'

RSpec.describe TweetsController, "#create" do
    context "When a tweet is created with invalid params" do
        it "Should re-render the tweet form" do
            expect {Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
        end  
    end
    context "When user is logged in" do
        let(:user){create(:user)}
        before do
            sign_in user
            post :create, params: {tweet: {text: "This is a tweet by test",user_id: user.id}}
        end
        it "should create a new tweet" do
            expect(Tweet.last.text).to eq("This is a tweet by test")
        end
        it "should redirect to Home" do
            expect(subject).to redirect_to home_path
        end
    end
end
