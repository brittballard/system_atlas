var SystemAtlas = (function($){
  jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
            xhr.setRequestHeader("Accept", "text/javascript")
        }
  });

  jQuery.extend({
    delete_post: function( url, data, callback, type ) {
      // shift arguments if data argument was omited
      if ( jQuery.isFunction( data ) ) {
        type = type || callback;
        callback = data;
        data = {};
      }

      return jQuery.ajax({
        type: "DELETE",
        url: url,
        data: data,
        success: callback,
        dataType: type
      });
    },
  
    put_post: function( url, data, callback, type ) {
      // shift arguments if data argument was omited
      if ( jQuery.isFunction( data ) ) {
        type = type || callback;
        callback = data;
        data = {};
      }

      return jQuery.ajax({
        type: "PUT",
        url: url,
        data: data,
        success: callback,
        dataType: type
      });
    }
  });
  
  return {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    init: function(servers){
      new SystemAtlas.Routers.Servers();
      this.servers = new SystemAtlas.Collections.Servers(servers)
      Backbone.history.start();
    }
  };
})(jQuery);