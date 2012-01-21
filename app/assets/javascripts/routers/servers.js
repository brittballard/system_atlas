SystemAtlas.Routers.Servers = Backbone.Router.extend(
  {
    routes: {
      "": "index"
    },
    
    index: function(){
      var view = new SystemAtlas.Views.ServersIndex({ collection: SystemAtlas.servers });
      $('body').html(view.render().el);
    }
  });