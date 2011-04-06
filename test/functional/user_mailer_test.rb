require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_next_time" do
    mail = UserMailer.send_next_time
    assert_equal "Send next time", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
