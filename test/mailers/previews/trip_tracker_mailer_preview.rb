# Preview all emails at http://localhost:3000/rails/mailers/trip_tracker_mailer
class TripTrackerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trip_tracker_mailer/weekly
  def weekly
    TripTrackerMailer.weekly
  end

  # Preview this email at http://localhost:3000/rails/mailers/trip_tracker_mailer/monthly
  def monthly
    TripTrackerMailer.monthly
  end

  # Preview this email at http://localhost:3000/rails/mailers/trip_tracker_mailer/yearly
  def yearly
    TripTrackerMailer.yearly
  end

end
