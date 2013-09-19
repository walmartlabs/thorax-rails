<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= @action.camelize %>View extends Thorax.View
  template: HBS["<%= hbs @action %>"]

  render: ->
    @$el.html(@template())
    return this
