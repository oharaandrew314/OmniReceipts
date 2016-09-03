class Receipt < ActiveRecord::Base
  belongs_to :user

  def name
    "#{store} on #{date}"
  end

  def as_json(options = { })
    h = super(options)
    h[:name] = name
    h
  end
end
