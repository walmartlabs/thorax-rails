class RootView extends LayoutView
  name: "root"
  template: HandlebarsTemplates["root"]

->
  instance
  RootView.getInstance = (target) ->
    if not instance
      instance = new RootView
      instance.appendTo target || document.body
    instance