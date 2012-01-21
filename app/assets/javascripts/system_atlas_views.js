SystemAtlas.views = (function($){
  return {
    relatipnshipsNew : function(deleteRelationshipUrl, relationshipUrl, childEntityIds, parentEntityId){
      for(var i = 0; i < childEntityIds.length; i++){
        systemAtlas.utility.setData($(String.concat('#', childEntityIds[i][0])), [['id', childEntityIds[i][1]]])
      }
      
      systemAtlas.utility.setData($(String.concat('#entity-', parentEntityId)), [['id', parentEntityId]])
      systemAtlas.utility.setData($('#unassigned-entities'), [['parentId', parentEntityId]])

      $(".draggable").draggable();
      
      $(String.concat('#entity-', parentEntityId)).droppable({
        drop: function(event, ui) {
          $('#relationships').append(String.concat("New Relationship entity with id ", ui.draggable.data("id"), ".<br>"));
          $.post(relationshipUrl,
            { parent: $(this).data('id'), child: ui.draggable.data("id") })
          }
      });
      
      $('#unassigned-entities').droppable({
        drop: function(event, ui) {
          $('#relationships').append(String.concat("Removed Relationship with entity with id ", ui.draggable.data("id"), ".<br>"));
          $.delete_post(deleteRelationshipUrl,
            { parent: $(this).data('parentId'), child: ui.draggable.data("id") })
        }
      });
    }
  }
})(jQuery);