class Messages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.string :image
      t.string :user_name
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
