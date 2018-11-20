class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
