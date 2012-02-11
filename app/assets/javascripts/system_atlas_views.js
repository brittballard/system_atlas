SystemAtlas.views = (function($){
  return {
    relatipnshipsNew : function(parentEntityId){
      $(".draggable").draggable();

      $('#entity-' + parentEntityId).droppable({
        drop: function(event, ui) {
          alert('drop on parent');
          }
      });
      
      $('#unassigned-entities').droppable({
        drop: function(event, ui) {
          alert('drop on palette');
        }
      });
    }
  }
})(jQuery);