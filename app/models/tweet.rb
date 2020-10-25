class Tweet < ApplicationRecord
    belongs_to :user
    validates :text, length: {minimum:1, maximum:280}
end
