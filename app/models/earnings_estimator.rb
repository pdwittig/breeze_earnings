class EarningsEstimator

  attr_reader :leasing_cost, :insurance_cost, :mobile_plan_cost, 
              :fuel_cost, :commute_distance, :days_per_week, :hours_per_week

  def initialize(args)
    @tasks = []
    load_tasks
    load_args(args)
  end

  def calculate_earnings_estimate
    net_earnings = 0
    @tasks.each { |task| net_earnings += task.calculate(self) }
    return net_earnings
  end

  private
  def load_tasks
    @tasks << StaticCostEstimator.new
    @tasks << FuelCostEstimator.new
    @tasks << IncomeEstimator.new
  end

  def load_args(args)
    @leasing_cost = 160
    @insurance_cost = -args[:insurance_cost] ||= 0
    @mobile_plan_cost = -args[:mobile_plan_cost] ||= 0
    @hours_per_week = args[:hours_per_week] ||= 0
    @days_per_week = args[:days_per_week] ||= 0
    @fuel_cost = -args[:fuel_cost] ||= 0
    @commute_distance = args[:commute_distance] ||= 0
  end

end