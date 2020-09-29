class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :text
      t.string :image
      t.integer :num_likes, null: false, default: 0
      t.integer :num_shares, null: false, default: 0
      t.integer :num_retweets, null: false, default: 0
      t.timestamps
    end
  end
end
