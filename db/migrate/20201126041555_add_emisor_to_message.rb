class AddEmisorToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :emisor_id, :integer
  end
end
