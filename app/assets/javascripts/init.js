$(document).ready(function() {

  var earningsEstimatorView = new EarningsEstimator.View();
  earningsEstimatorView.bindEvents();

  var earningsEstimatorController = new EarningsEstimator.Controller(earningsEstimatorView);
  earningsEstimatorView.registerEventDelegate(earningsEstimatorController);

})