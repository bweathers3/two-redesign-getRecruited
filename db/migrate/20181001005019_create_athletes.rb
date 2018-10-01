class CreateAthletes < ActiveRecord::Migration[5.1]
  def change
    create_table :athletes do |t|
      t.string :firstName
      t.string :middleName
      t.string :lastName

      t.timestamps
    end
  end
end
