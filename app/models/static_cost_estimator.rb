class StaticCostEstimator

  def calculate(sender)
    static_costs = [sender.leasing_cost,
                    sender.insurance_cost,
                    sender.mobile_plan_cost]

    static_costs.reduce(:+)
  end

end