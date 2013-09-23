<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Thorax.View
  template: Handlebars.templates["<%= hbs 'new' %>"]

  events:
    "submit #new-<%= singular_name %>": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (<%= singular_name %>) =>
        @model = <%= singular_name %>
        window.location.hash = "/#{@model.id}"

      error: (<%= singular_name %>, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
