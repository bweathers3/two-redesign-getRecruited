class CreateSwimmings < ActiveRecord::Migration[5.1]
  def change
    create_table :swimmings do |t|
      t.string :frSCY50
      t.string :frSCM50
      t.string :frLCM50
      t.string :frSCY100
      t.string :frSCM100
      t.string :frLCM100
      t.string :frSCY200
      t.string :frSCM200
      t.string :frLCM200
      t.string :frSCY500
      t.string :frSCM400
      t.string :frLCM400
      t.string :frSCY1000
      t.string :frSCM800
      t.string :frLCM800
      t.string :frSCY1650
      t.string :frSCM1500
      t.string :frLCM1500
      t.string :bkSCY50
      t.string :bkSCM50
      t.string :bkLCM50
      t.string :bkSCY100
      t.string :bkSCM100
      t.string :bkLCM100
      t.string :bkSCY200
      t.string :bkSCM200
      t.string :bkLCM200
      t.string :brSCY50
      t.string :brSCM50
      t.string :brLCM50
      t.string :brSCY100
      t.string :brSCM100
      t.string :brLCM100
      t.string :brSCY200
      t.string :brSCM200
      t.string :brLCM200
      t.string :flSCY50
      t.string :flSCM50
      t.string :flLCM50
      t.string :flSCY100
      t.string :flSCM100
      t.string :flLCM100
      t.string :flSCY200
      t.string :flSCM200
      t.string :flLCM200
      t.string :imSCY100
      t.string :imSCM100
      t.string :imSCY200
      t.string :imSCM200
      t.string :imLCM200
      t.string :imSCY400
      t.string :imSCM400
      t.string :imLCM400
      
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
