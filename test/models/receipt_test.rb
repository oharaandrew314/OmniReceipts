require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  test "name of default receipt" do
    receipt = Receipt.new
    date = Date.today
    assert_equal "Receipt from #{date}", receipt.name
  end

  test "name of receipt with store and date" do
    receipt = receipts(:noImage)
    assert_equal "WalMart on 2016-09-03", receipt.name
  end

  test "nil image link if no image" do
    receipt = receipts(:noImage)
    assert_nil receipt.image_link
  end

  test "google image link" do
    receipt = receipts(:googleImage)
    assert_not_nil receipt.image_link
  end
end
