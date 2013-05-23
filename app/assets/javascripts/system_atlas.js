var SystemAtlas = (function($){
  jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
            xhr.setRequestHeader("Accept", "text/javascript")
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        }
  });

  jQuery.extend({
    delete_request: function( url, data, callback, type ) {
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
  
    put_request: function( url, data, callback, type ) {
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
})(jQuery);
