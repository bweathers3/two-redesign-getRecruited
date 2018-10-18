class CreateAcademics < ActiveRecord::Migration[5.1]
  def change
    create_table :academics do |t|
      t.string :schoolName
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :satMath
      t.string :satEnglish
      t.string :satTotal
      t.string :actTotal
      t.string :gpa
      t.string :gpaScale
      t.string :classRank
      t.string :classSize
      t.text :notes
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
