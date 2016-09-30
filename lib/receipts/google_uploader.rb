require 'google/apis/drive_v3'

Drive = Google::Apis::DriveV3

module GoogleUploader
  def upload_receipt(receipt, image)
    drive = Drive::DriveService.new
    drive.authorization = receipt.user.oauth_token

    if receipt.google_folder_id.nil?
      file_metadata = {
        name: 'Omni Receipts',
        mime_type: 'application/vnd.google-apps.folder'
      }
      metadata = drive.create_file file_metadata, fields: 'id'
      receipt.google_folder_id = metadata.id
      receipt.save!
    end

    if receipt.google_image_id.nil?
      file_metadata = {
        name: receipt.id,
        mime_type: image.content_type,
        parents: [ receipt.google_folder_id ]
      }
      metadata = drive.create_file file_metadata, fields: 'id', upload_source: image.to_io
      receipt.google_image_id = metadata.id
      receipt.save!
    else
      drive.update_file receipt.google_image_id, upload_source: image.to_io
    end
  end
end
