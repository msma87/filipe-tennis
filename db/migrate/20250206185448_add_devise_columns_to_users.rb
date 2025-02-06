class AddDeviseColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    ## Apenas adicionamos colunas se elas não existirem
    unless column_exists?(:users, :encrypted_password)
      add_column :users, :encrypted_password, :string, null: false, default: ""
    end

    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
      add_index :users, :reset_password_token, unique: true
    end

    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end
  end
end
