class Receipt < ActiveRecord::Base
  belongs_to :user
  has_many :items
  after_initialize :init

  def init
    self.date ||= Date.today
  end

  def image_link
    if not google_image_id.nil?
       "https://drive.google.com/uc?export=view&id=#{google_image_id}"
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
end
