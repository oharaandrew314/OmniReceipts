class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :receipt, foreign_key: true

      t.timestamps null: false
    end
  end
end
