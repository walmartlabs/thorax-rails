//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require handlebars.runtime
//= require thorax
//= require root
//= require view
//= require collection-view
//= require layout-view
//= require model
//= require collection
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .
function initialize(complete) {
  // Configure Backbone to talk with Rails
  Backbone.ajax = function() {
    Backbone.$.ajaxSetup.call(Backbone.$, {
      beforeSend: function(jqXHR){
        var token = $('meta[name='csrf-token']').attr('content');
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
    Example.RootView.getInstance(document.body);

    complete(function() {
      Backbone.history.loadUrl();
    });
  });
}

initialize();