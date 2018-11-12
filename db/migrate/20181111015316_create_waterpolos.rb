class CreateWaterpolos < ActiveRecord::Migration[5.1]
  def change
    create_table :waterpolos do |t|
      t.string :height
      t.string :weight
      t.string :jersey
      t.boolean :goalie, default: false
      t.boolean :center, default: false
      t.boolean :defender, default: false
      t.boolean :attacker, default: false
      t.boolean :utility, default: false
      t.boolean :right, default: false
      t.boolean :left, default: false
      t.string :frSCY50
      t.string :frSCY100
      t.string :frSCY200
      t.text :nationalTeamExp
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
