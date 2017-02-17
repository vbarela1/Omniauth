require 'test_helper'

class TripTrackerMailerTest < ActionMailer::TestCase
  test "weekly" do
    mail = TripTrackerMailer.weekly
    assert_equal "Weekly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "monthly" do
    mail = TripTrackerMailer.monthly
    assert_equal "Monthly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "yearly" do
    mail = TripTrackerMailer.yearly
    assert_equal "Yearly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
