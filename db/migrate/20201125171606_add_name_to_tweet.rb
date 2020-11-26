class AddNameToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :user_name, :string
  end
end
