class CreateMyprograms < ActiveRecord::Migration[5.1]
  def change
    create_table :myprograms do |t|
      t.boolean :public, :default => false
      t.references :sport, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
