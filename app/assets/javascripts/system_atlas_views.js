SystemAtlas.views = (function($){
  return {
    relatipnshipsManage : function(parentEntityId){
      // $(".draggable").draggable();

      $('#entity-' + parentEntityId).droppable({
        drop: function(event, ui) {
            $.post($(this).data('create_url'),
                                { parent_id: $(this).data('id'), child_id: ui.draggable.data('id') });
          }
      });
      
      $('#unassigned-entities').droppable({
        drop: function(event, ui) {
          $.delete_request(ui.draggable.data("delete_url"),
                            { id: "test" });          
        }
      });
      
      $('#available-entities, #child-entities').sortable({
        placeholder: "ui-state-highlight",
        connectWith: ".entity-list",
      });
      
      $( "#sortable" ).disableSelection();
    }
  }
})(jQuery);