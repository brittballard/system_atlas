SystemAtlas = {
  boot: function(){
    $(document).on('click', "[data-role='associate-button']", function(event){
      $.ajax({
        type: 'POST',
        url: $("[data-role='routes']").data('create-relationship'),
        data: {
          parent_id: $("[data-role='parent']").data('entity-id'),
          child_ids: _.map(
            $("[data-role='entity-palette'] li.ui-selected"),
            function(item){
              return $(item).data('entity-id');
            })
        }
      });
    });

    $(document).on('click', "[data-role='disassociate-button']", function(event){
      $.ajax({
        type: 'DELETE',
        url: $(this).data('relationship-destroy'),
        data: {
          ids: _.map(
            $("[data-role='child-container'] li.ui-selected"),
            function(item){
              return $(item).data('relationship-id');
            })
        }
      });
    });
  }
}
