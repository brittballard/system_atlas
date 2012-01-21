SystemAtlas.Views.ServersIndex = Backbone.View.extend({
  initialize: function() {
  },

  render: function () {
    $(this.el).html(JST['servers/index']({ servers: this.collection }));

      var self = this;
      this.collection.each(function(server) {
        var serverView = new SystemAtlas.Views.ServerView({model: server});
        self.$('table').append(serverView.render().el);
      });

      return this;
  }
});