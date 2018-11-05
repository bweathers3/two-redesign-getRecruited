class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :sport
      t.string :coach
      t.string :email1address
      t.string :coachPhone
      t.string :division
      t.string :region
      t.string :athleticWebsite
      t.string :blank
      t.string :sir
      t.string :firstName
      t.string :lastName
      t.string :collegeName
      t.string :address
      t.string :stateAndZip

      t.timestamps
    end
  end
end
