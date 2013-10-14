function initialize(complete) {
  // Configure Backbone to talk with Rails
  Backbone.ajax = function() {
    Backbone.$.ajaxSetup.call(Backbone.$, {
      beforeSend: function(jqXHR){
        var token = $("meta[name='csrf-token']").attr('content');
        jqXHR.setRequestHeader('X-CSRF-Token', token);
      }
    });
    return Backbone.$.ajax.apply(Backbone.$, arguments);
  };
  $(function() {
    Backbone.history.start({
      pushState: false,
      root: '/',
      silent: true
    });

    // RootView may use link or url helpers which
    // depend on Backbone history being setup
    // so need to wait to loadUrl() (which will)
    // actually execute the route
    <%= js_app_name %>.RootView.getInstance(document.body);

    complete(function() {
      Backbone.history.loadUrl();
    });
  });
}

initialize(function(next) {
  // things to do when your application is loaded!
  next();
});