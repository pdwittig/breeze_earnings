class EarningsController < ApplicationController

  def index
    
  end

  def calculate
    p params['earnings']
    earnings_estimator = EarningsEstimator.new(params[:estimate])
    render json: earnings_estimator.calculate_earnings_estimate
  end

end