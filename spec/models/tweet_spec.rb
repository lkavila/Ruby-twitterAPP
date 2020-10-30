require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'validations' do
    it { should validate_length_of(:text) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
  end
  
end
