class RootView extends <%= js_app_name %>.LayoutView
  name: "root"
  template: HandlebarsTemplates["root"]

->
  instance
  RootView.getInstance = (target) ->
    if not instance
      instance = new RootView
      instance.appendTo target || document.body
    instance