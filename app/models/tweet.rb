class Tweet < ApplicationRecord
    belongs_to :user
    validates :text, length: {minimum:1, maximum:280}
    has_one_attached :image, dependent: :destroy
    has_many :likes
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end
end
