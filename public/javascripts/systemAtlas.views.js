systemAtlas.views = (function($){
  return {
    relatipnshipsNew : function(newRelationshipUrl, childEntityIds, parentEntityId){
      for(var i = 0; i < childEntityIds.length; i++){
        systemAtlas.utility.setData($(String.concat('#', childEntityIds[i][0])), [['id', childEntityIds[i][1]]])
      }
      
      systemAtlas.utility.setData($(String.concat('#entity-', parentEntityId)), [['id', parentEntityId]])

      $(".draggable").draggable();
      
      $(".droppable").droppable({
        drop: function(event, ui) {
          $('#relationships').append(String.concat("New Relationship entity with id ", ui.draggable.data("id"), ".<br>"));
          $.post(newRelationshipUrl,
            { parent: $(this).data('id'), child: ui.draggable.data("id") })
          }
      });
    }
  }
})(jQuery);