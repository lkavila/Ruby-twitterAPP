class Tweet < ApplicationRecord
    belongs_to :user
    validates :text, length: {minimum:280, maximum:1}
end
