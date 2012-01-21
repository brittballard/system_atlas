SystemAtlas.Routers.Servers = Backbone.Router.extend(
  {
    routes: {
      "": "index"
    },
    
    index: function(){
      alert('Hello, world! Lay back I\'ve got some money to make.');
    }
  });