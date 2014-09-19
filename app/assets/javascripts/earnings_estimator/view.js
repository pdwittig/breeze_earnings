EarningsEstimator.View = function() {
  this.eventDelegate = {}
  this.formSelector = '#earnings-form'
  this.earningsEstimateSelector = '#earnings-estimate'
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
    $(this.earningsEstimateSelector).empty().html("Estimate: " + data);
  }
}