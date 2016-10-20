require 'aws-sdk'

class Receipt < ActiveRecord::Base

  belongs_to :user
  has_many :items, dependent: :destroy
  after_initialize :init

  def init
    self.date ||= Date.today
  end

  def image_link
    if not google_image_id.nil?
      bucket = get_bucket
      object = bucket.object google_image_id
      object.presigned_url :get
    end
  end

  def name
    if store and date
      return "#{store} on #{date}"
    elsif store
      return "Receipt from #{store}"
    else
      return "Receipt from #{date}"
    end
  end

  def image=(receipt_file)
    bucket = get_bucket

    # Delete old file
    if !self.google_image_id.nil?
      obj = bucket.object self.google_image_id
      obj.delete
    end

    # Upload new file
    self.google_image_id = "users/#{user.id}/receipts/#{id}/#{receipt_file.original_filename}"
    obj = bucket.object self.google_image_id
    obj.put body: receipt_file.to_io
  end

  private
    def get_bucket
      s3 = Aws::S3::Resource.new
      bucket = s3.bucket Figaro.env.AWS_S3_BUCKET
    end
end
