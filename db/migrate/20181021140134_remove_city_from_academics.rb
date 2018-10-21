class RemoveCityFromAcademics < ActiveRecord::Migration[5.1]
  def change
    remove_column :academics, :city, :string
    remove_column :academics, :state, :string
    remove_column :academics, :country, :string
  end
end
