class AddUserInformation < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :blood_type, :integer
    add_column :users, :rh, :boolean
    add_column :users, :address, :string
    add_column :users, :phone_num, :string
    add_column :users, :lbo, :string
  end
end
