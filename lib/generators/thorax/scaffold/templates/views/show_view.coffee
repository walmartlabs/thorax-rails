<%= view_namespace %> ||= {}

class <%= view_namespace %>.ShowView extends View
  template: Handlebars.templates["<%= hbs 'show' %>"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
