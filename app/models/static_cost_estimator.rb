class StaticCostEstimator

  def calculate(earnings_estimator)
    static_costs = [earnings_estimator.leasing_cost,
                    earnings_estimator.insurance_cost,
                    earnings_estimator.mobile_plan_cost]
    static_costs.reduce(:+)
  end

end