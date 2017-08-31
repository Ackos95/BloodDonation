(function(document) {
  $(document).on('turbolinks:load', init);
  
  function init() {
    initSearchHandlers();
  }

  function initSearchHandlers() {
    $('#show-advanced-search').on('click', function(e) {
      $('#adv-search').removeClass('hidden');
      $('#simple-search').addClass('hidden');
    });

    $('#hide-advanced-search').on('click', function(e) {
      $('#adv-search').addClass('hidden');
      $('#simple-search').removeClass('hidden');
    });
  }
})(document);