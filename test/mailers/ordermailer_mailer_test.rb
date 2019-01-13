require 'test_helper'

class OrdermailerMailerTest < ActionMailer::TestCase
  test "receipt" do
    mail = OrdermailerMailer.receipt
    assert_equal "Receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
