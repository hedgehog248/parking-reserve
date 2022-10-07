window.addEventListener("load", function(){
  const ScrollHint = require('scroll-hint');
  new ScrollHint('.js-scrollable', {
    i18n: {
      scrollable: 'スクロールできます'
    }
  }); 
})