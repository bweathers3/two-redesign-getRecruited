class CreateMyteams < ActiveRecord::Migration[5.1]
  def change
    create_table :myteams do |t|
      t.string :sport
      t.string :coach
      t.string :division
      t.string :collegeName
      t.boolean :public, :default => false
      t.references :sport, foreign_key: true
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
