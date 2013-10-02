<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= singular_name.camelize %>View extends View
  template: Handlebars.templates["<%= hbs singular_name %>"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
