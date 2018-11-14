class CreateJoinTableProgramsSports < ActiveRecord::Migration[5.1]
  def change
    create_join_table :programs, :sports do |t|
      # t.index [:program_id, :sport_id]
      # t.index [:sport_id, :program_id]
      t.boolean :public, default: false
    end
  end
end
