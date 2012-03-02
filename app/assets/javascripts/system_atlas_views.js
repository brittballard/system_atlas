SystemAtlas.views = (function($){
  return {
    relatipnshipsManage : function(parentEntityId){
      $('#available-entities').sortable({
        placeholder: "ui-state-highlight",
        connectWith: ".entity-list",
        receive: function(event, ui) {
          $.delete_request(ui.item.data("delete_url"));
        } 
      });
      
      $('#child-entities').sortable({
        placeholder: "ui-state-highlight",
        connectWith: ".entity-list",
        receive: function(event, ui) {
          $.post($(this).data('create_url'),
                  { parent_id: $(this).data('id'), child_id: ui.item.data('id') });
        } 
      });
      
      $( "#sortable" ).disableSelection();
    }
  }
})(jQuery);