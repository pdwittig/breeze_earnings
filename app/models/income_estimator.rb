class IncomeEstimator

  def calculate(sender)
    sender.hours_per_week * sender.wage_per_hour
  end

end