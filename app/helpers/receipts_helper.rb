module ReceiptsHelper

  def receipt_name(receipt)
    receipt.name
  end

  def stores(user)
    stores = Set.new
    user.receipts.each do |receipt|
      stores.add(receipt.store)
    end
    return stores
  end

  def receipt_image_link(receipt)
    receipt.image_link
  end
end
