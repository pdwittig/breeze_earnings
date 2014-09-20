EarningsEstimator.View = function() {
  this.eventDelegate = {}
  this.formSelector = '#earnings-form'
  this.earningsPerWeekSelector = '.earnings-output-week h1'
  this.earningsPerHourSelector = '.earnings-output-hour h1'
}

EarningsEstimator.View.prototype = {
  bindEvents: function() {
    $('body').on("ajax:success", function(e, data) {
      this.eventDelegate.handleFormSubmission(e, data);
    }.bind(this))
  },
  
  registerEventDelegate: function(delegate) {
    this.eventDelegate = delegate;
  },

  update: function(data) {
    if (data.earnings_per_week && data.earnings_per_hour) {
      $(this.earningsPerWeekSelector).empty().html("$" + data.earnings_per_week.toFixed(2));
      $(this.earningsPerHourSelector).empty().html("$" + data.earnings_per_hour.toFixed(2));
    }
  }
}