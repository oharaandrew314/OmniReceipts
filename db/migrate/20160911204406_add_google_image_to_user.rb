class AddGoogleImageToUser < ActiveRecord::Migration
  def change
    add_column :receipts, :google_folder_id, :string
    add_column :receipts, :google_image_id, :string
  end
end
