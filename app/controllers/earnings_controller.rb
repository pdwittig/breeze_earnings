class EarningsController < ApplicationController

  def index
    
  end

  def calculate
    earnings_estimator = EarningsEstimator.new(params[:earnings])
    render json: earnings_estimator.calculate_earnings_estimate
  end

end