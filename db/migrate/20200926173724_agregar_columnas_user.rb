class AgregarColumnasUser < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :confirmation_token, :string
      add_column :users, :confirmed_at, :datetime
      add_column :users, :confirmation_sent_at, :datetime
      add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
      add_column :users, :birth, :datetime
      add_column :users, :bio, :string
  end
end
