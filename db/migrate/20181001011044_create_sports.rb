class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :sport
      t.references :athlete, index: true, foreign_key: true

      t.timestamps
    end
  end
end
