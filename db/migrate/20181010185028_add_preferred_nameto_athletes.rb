class AddPreferredNametoAthletes < ActiveRecord::Migration[5.1]
  def change
    add_column :athletes, :preferredName, :string
    add_column :athletes, :yearStartingSchool, :string
    add_column :athletes, :active, :boolean, :default => true
  end
end
