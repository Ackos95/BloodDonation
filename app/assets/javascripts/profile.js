(function(document) {
  $(document).on('turbolinks:load', init);
  
  function init() {
    initProfileHandlers();
  }

  function initProfileHandlers() {
    $('#edit-profile-btn').on('click', function(e) {
      console.log('Clicked');
      $('#profile-edit').removeClass('hidden');
      $('#profile-show').addClass('hidden');
    });

    $('#hide-advanced-search').on('click', function(e) {
      $('#profile-edit').addClass('hidden');
      $('#profile-show').removeClass('hidden');
    });
  }
})(document);