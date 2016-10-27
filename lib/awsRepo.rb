require 'aws-sdk'

class AwsRepo
  def initialize(bucket_name)
    @bucket_name = bucket_name
  end

  def delete(path)
    obj = object path
    obj.delete if !obj.nil?
  end

  def upload(path, upload_io)
    obj = object path
    obj.put body: upload_io
  end

  def link(path)
    obj = object path
    obj.presigned_url :get if !obj.nil?
  end

  private
    def bucket
      s3 = Aws::S3::Resource.new
      s3.bucket @bucket_name
    end

    def object(path)
      bucket.object path
    end
end