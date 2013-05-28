SystemAtlas = {
  boot: function(){
          $(document).on('click', "[data-role='associate-button']", function(event){
            $.ajax({
              type: 'POST',
              url: $("[data-role='routes']").data('create-relationship'),
              data: {
                parent_id: $("[data-role='parent']").data('entity-id'),
                child_id: $("[data-role='entity-palette'] .ui-selected").data('entity-id')
            }
          });
        });
      }
}
