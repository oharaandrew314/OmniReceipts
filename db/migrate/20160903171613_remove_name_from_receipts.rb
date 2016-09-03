class RemoveNameFromReceipts < ActiveRecord::Migration
  def change
    remove_column :receipts, :name
  end
end
