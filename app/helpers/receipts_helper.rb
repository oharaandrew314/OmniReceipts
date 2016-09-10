module ReceiptsHelper

  def stores(user)
    stores = Set.new
    user.receipts.each do |receipt|
      stores.add(receipt.store)
    end
    return stores
  end
end
