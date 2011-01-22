systemAtlas.utility = (function($){
  return {
    setData : function(element, dataDefs){
      for(var i = 0; i < dataDefs.length; i++){
        element.data(dataDefs[i][0], dataDefs[i][1]);
      }
    }
  }
})(jQuery);