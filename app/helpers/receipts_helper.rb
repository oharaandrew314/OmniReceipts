module ReceiptsHelper

  def receipt_name(receipt)
    "#{receipt.store} on #{receipt.date}"
  end

  def stores(user)
    stores = Set.new
    user.receipts.each do |receipt|
      stores.add(receipt.store)
    end
    return stores
  end

  def receipt_image_link(receipt)
    "https://drive.google.com/uc?export=view&id=#{receipt.google_image_id}"
  end
end
