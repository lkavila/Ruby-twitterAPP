class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :tweet, null: false, foreign_key: true
      t.integer :likes, null: false, default: 0
      t.timestamps
    end
  end
end
