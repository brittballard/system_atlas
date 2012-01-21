SystemAtlas.Views.ServerView = Backbone.View.extend({
  tagName: "tr",
  
  initialize: function() {
  },

  render: function () {
    $(this.el).html(JST['servers/show']({ model: this.model }));
    return this;
  }
});