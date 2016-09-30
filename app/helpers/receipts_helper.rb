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
end
