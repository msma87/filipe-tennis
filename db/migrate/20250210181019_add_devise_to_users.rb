# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email,              null: false, default: "" # Já existe
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false # Já existe
      # t.datetime :current_sign_in_at # Já existe
      # t.datetime :last_sign_in_at # Já existe
      # t.string   :current_sign_in_ip # Já existe
      # t.string   :last_sign_in_ip # Já existe

      ## Confirmable
      # t.string   :confirmation_token # Já existe
      # t.datetime :confirmed_at # Já existe
      # t.datetime :confirmation_sent_at # Já existe
      # t.string   :unconfirmed_email # Já existe

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Já existe
      t.datetime :locked_at
    end

    # add_index :users, :email, unique: true # Já existe
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token, unique: true # Já existe
    # add_index :users, :unlock_token, unique: true # Já existe
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
