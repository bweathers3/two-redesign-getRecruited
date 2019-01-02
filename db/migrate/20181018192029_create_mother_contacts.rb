class CreateMotherContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :mother_contacts do |t|
      t.string :firstName, :default => "Information Needed"
      t.string :lastName
      t.string :phone
      t.string :email
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
