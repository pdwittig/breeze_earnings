class FuelCostEstimator

  def calculate(sender)
    commute_cost(sender) + on_the_clock_cost(sender)
  end

  private
  def commute_cost(sender)
    sender.days_per_week * sender.commute_distance * 2 / sender.miles_per_gallon * sender.fuel_cost
  end

  def on_the_clock_cost(sender)
    sender.hours_per_week * sender.miles_per_hour / sender.miles_per_gallon * sender.fuel_cost
  end

end
