class CreateDivings < ActiveRecord::Migration[5.1]
  def change
    create_table :divings do |t|
      t.string :oneD1score
      t.string :oneD1name
      t.string :oneD1date
      t.string :oneD2score
      t.string :oneD2name
      t.string :oneD2date
      t.string :oneD3score
      t.string :oneD3name
      t.string :oneD3date
      t.string :oneD4score
      t.string :oneD4name
      t.string :oneD4date
      t.string :oneD5score
      t.string :oneD5name
      t.string :oneD5date
      t.string :oneD6score
      t.string :oneD6name
      t.string :oneD6date
      t.string :threeD1score
      t.string :threeD1name
      t.string :threeD1date
      t.string :threeD2score
      t.string :threeD2name
      t.string :threeD2date
      t.string :threeD3score
      t.string :threeD3name
      t.string :threeD3date
      t.string :threeD4score
      t.string :threeD4name
      t.string :threeD4date
      t.string :threeD5score
      t.string :threeD5name
      t.string :threeD5date
      t.string :threeD6score
      t.string :threeD6name
      t.string :threeD6date
      t.string :tenD1score
      t.string :tenD1name
      t.string :tenD1date
      t.string :tenD2score
      t.string :tenD2name
      t.string :tenD2date
      t.string :tenD3score
      t.string :tenD3name
      t.string :tenD3date
      t.string :tenD4score
      t.string :tenD4name
      t.string :tenD4date
      t.string :tenD5score
      t.string :tenD5name
      t.string :tenD5date
      t.string :tenD6score
      t.string :tenD6name
      t.string :tenD6date
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
