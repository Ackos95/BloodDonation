class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.datetime :timestamp
      t.boolean :shown, default: false
      t.boolean :checked, default: false
    end
  end
end
