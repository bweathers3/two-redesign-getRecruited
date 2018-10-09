class AddUserToAthletes < ActiveRecord::Migration[5.1]
  def change
    add_column :athletes, :user_id, :integer
    add_index :athletes, :user_id
  end
end
