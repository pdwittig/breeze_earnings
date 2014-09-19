class IncomeEstimator

  def initialize(earnings_per_hour = 25)
    @earnings_per_hour = earnings_per_hour
  end

  def calculate(earnings_estimator)
    earnings_estimator.hours_per_week * @earnings_per_hour
  end
end