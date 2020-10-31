require 'rails_helper'

RSpec.describe RelationshipsController, "#dsvsdsdfsd" do
    context "When a user is trying to follow another one" do
        it "Should redirect to profile again" do
            expect(response.status).to eq(200)
        end
    end
    
    context "list following" do
        it "id does not exits" do
            expect {User.find}.to raise_error(ActiveRecord::RecordNotFound)  
        end
    end
    

end