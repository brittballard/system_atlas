SystemAtlas.views = (function($){
  return {
    relatipnshipsManage : function(parentEntityId){
      $(".draggable").draggable();

      $('#entity-' + parentEntityId).droppable({
        drop: function(event, ui) {
            $.post($(this).data('create_url'),
                      { parent_id: $(this).data('id'), child_id: ui.draggable.data('id') });
          }
      });
      
      $('#unassigned-entities').droppable({
        drop: function(event, ui) {
          $.delete_request(ui.draggable.data("delete_url"),
                      { parent_id: $(this).data('parent_id'), child_id: ui.draggable.data("id") });          
        }
      });
    }
  }
})(jQuery);