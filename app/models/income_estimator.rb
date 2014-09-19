class IncomeEstimator

  def calculate(sender)
    sender.hours_per_week * sender.earnings_per_hour
  end

end