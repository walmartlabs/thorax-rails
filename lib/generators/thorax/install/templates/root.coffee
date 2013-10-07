class <%= js_app_name %>.RootView extends <%= js_app_name %>.LayoutView
  name: "root"
  template: HandlebarsTemplates["root"]

do ->
  instance = null
  <%= js_app_name %>.RootView.getInstance = (target) ->
    if not instance
      instance = new <%= js_app_name %>.RootView
      instance.appendTo target || document.body
    instance