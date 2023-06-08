class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid,      :integer, null: false
    add_column :users, :provider, :string, null: false, default: ""

    add_index :users, [:uid, :provider], unique: true
  end
end
