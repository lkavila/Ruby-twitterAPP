class Tweet < ApplicationRecord
    belongs_to :user
    validates :text, length: {minimum:1, maximum:280}
    has_one_attached :image, dependent: :destroy

    def self.buscador(termino)
        Tweet.where("text LIKE ?", "%#{termino}%")
    end
end
