class AddPasswordToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :password, :string
  end
end
