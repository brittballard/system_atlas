systemAtlas.views = (function($){
  return {
    relatipnships_new : function(){
      $( "#draggable" ).draggable();
          $( "#droppable" ).droppable({
            drop: function( event, ui ) {
              $( this )
                .find( "p" )
                  .html( "Dropped!" );
            }
          });
    }
  }
})(jQuery);