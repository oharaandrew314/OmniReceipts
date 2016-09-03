class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :name
      t.string :store
      t.date :date

      t.timestamps null: false
    end
  end
end
