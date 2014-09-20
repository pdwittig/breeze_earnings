class EarningsEstimator

  attr_reader :leasing_cost, :insurance_cost, :mobile_plan_cost, 
              :fuel_cost, :commute_distance, :days_per_week, :hours_per_week,
              :miles_per_gallon, :wage_per_hour, :miles_per_hour

  def initialize(args)
    @calc_strategies = ["StaticCostEstimator", "FuelCostEstimator", "IncomeEstimator"]
    @tasks = []
    load_tasks
    load_args(args)
  end

  def calculate_earnings_estimate
    earnings_per_week = 0
    @tasks.each { |task| earnings_per_week += task.calculate(self) }
    earnings_per_hour = earnings_per_week / @hours_per_week
    return { earnings_per_week: earnings_per_week, earnings_per_hour: earnings_per_hour }
  end

  private
  def load_tasks
    @calc_strategies.each { |strategy| @tasks << strategy.constantize.send('new') }
  end

  def load_args(args)
    #load from environment
    @miles_per_hour = ENV['miles_per_hour'].to_i
    @miles_per_gallon = ENV['miles_per_gallon'].to_f
    @wage_per_hour = ENV['wage_per_hour'].to_i
    @leasing_cost = normalize_to_negative(ENV['leasing_cost'])

    #load from args
    @days_per_week = args[:days_per_week].to_i
    @hours_per_week = args[:hours_per_week].to_i
    @commute_distance = args[:commute_distance].to_i
    @insurance_cost = normalize_to_negative(args[:insurance_cost])
    @mobile_plan_cost = normalize_to_negative(args[:mobile_plan_cost])
    @fuel_cost = normalize_to_negative(args[:fuel_cost])
  end

  def normalize_to_negative(value)
    value.to_i.abs * -1
  end

end