require 'awsRepo'

class Receipt < ActiveRecord::Base

  belongs_to :user
  has_many :items, dependent: :destroy
  after_initialize :init

  def init
    self.date ||= Date.today
  end

  def image_link
    if not google_image_id.nil?
      image_repo.link google_image_id
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

  def update_image(receipt_file)
    if !google_image_id.nil?
      image_repo.delete(google_image_id)
      self.google_image_id = nil
      self.save!
    end

    new_image_path = "users/#{user.id}/receipts/#{id}/#{receipt_file.original_filename}"
    image_repo.upload(new_image_path, receipt_file.to_io)

    self.google_image_id = new_image_path
    self.save!
  end

  def image_repo
    @image_repo ||= AwsRepo.new(Figaro.env.AWS_S3_BUCKET)
  end

  private
    def get_bucket
      s3 = Aws::S3::Resource.new
      bucket = s3.bucket Figaro.env.AWS_S3_BUCKET
    end
end
