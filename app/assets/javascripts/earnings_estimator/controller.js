EarningsEstimator.Controller = function(view) {
  this.view = view;
}

EarningsEstimator.Controller.prototype = {
  handleFormSubmission: function(e, data) {
    this.updateView(data);
  },

  updateView: function(data) {
    this.view.update(data);
  }
}