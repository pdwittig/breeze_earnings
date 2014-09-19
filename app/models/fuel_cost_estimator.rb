class FuelCostEstimator

  def initialize
    @avg_miles_hour = 12
    @miles_per_gallon = 50.0
  end

  def calculate(earnings_estimator)
    commute_cost(earnings_estimator) + on_the_clock_cost(earnings_estimator)
  end

  private
  def commute_cost(earnings_estimator)
    earnings_estimator.days_per_week * earnings_estimator.commute_distance * 2 / @miles_per_gallon * earnings_estimator.fuel_cost
  end

  def on_the_clock_cost(earnings_estimator)
    earnings_estimator.hours_per_week * @avg_miles_hour / @miles_per_gallon * earnings_estimator.fuel_cost
  end
end
