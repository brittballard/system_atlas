SystemAtlas.views = (function($){
  return {
    relatipnshipsManage : function(parentEntityId){
      // $(".draggable").draggable();

      $('#create-relationship').droppable({
        drop: function(event, ui) {
            $.post($(this).data('create_url'),
                                { parent_id: $(this).data('id'), child_id: ui.draggable.data('id') });
          }
      });
      
      $('#destroy-relationship').droppable({
        drop: function(event, ui) {
          $.delete_request(ui.draggable.data("delete_url"));          
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