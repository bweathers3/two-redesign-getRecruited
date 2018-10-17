class AddStartSportDataToSports < ActiveRecord::Migration[5.1]
  def change
    add_column :sports, :startSportData, :boolean, :default => false
  end
end
