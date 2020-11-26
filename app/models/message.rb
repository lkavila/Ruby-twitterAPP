class Message < ApplicationRecord
    belongs_to :user
    belongs_to :emisor, class_name: 'User', foreign_key: :emisor_id
  end