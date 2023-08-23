class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :user_name
      t.string :type
      t.string :email
      t.string :phone_no
      t.date :DOB

      t.timestamps
    end
  end
end
