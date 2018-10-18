class CreateFatherAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :father_addresses do |t|
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
