class CreateSiblings < ActiveRecord::Migration[5.1]
  def change
    create_table :siblings do |t|
      t.text :siblingNames
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
