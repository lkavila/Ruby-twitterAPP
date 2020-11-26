class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         handle_asynchronously :send_reset_password_instructions
         handle_asynchronously :send_confirmation_instructions
         handle_asynchronously :send_on_create_confirmation_instructions
  has_many :messages
  has_many :sended_messages, class_name: 'Message', foreign_key: :emisor_id
  has_many :tweets
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  # Seguir a un usuario.
  def follow(other_user)
    following << other_user
  end
 
  # No seguir a un usuario.
  def unfollow(other_user)
    following.delete(other_user)
  end
 
  # Retorna verdadero si el usuario actual esta siguiendo a otro usuario.
  def following?(other_user)
    following.include?(other_user)
  end

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
