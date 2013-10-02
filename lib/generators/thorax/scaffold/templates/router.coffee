class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @<%= plural_name %> = new <%= collection_namespace %>Collection()
    @<%= plural_name %>.reset options.<%= plural_name %>

  routes:
    "create"      : "create"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  create: ->
    view = new <%= "#{view_namespace}.CreateView(collection: @#{plural_name})" %>
    RootView.getInstance().setView view

  index: ->
    view = new <%= "#{view_namespace}.IndexView(#{plural_name}: @#{plural_name})" %>
    RootView.getInstance().setView view

  show: (id) ->
    <%= singular_name %> = @<%= plural_name %>.get(id)

    view = new <%= "#{view_namespace}.ShowView(model: #{singular_name})" %>
    RootView.getInstance().setView view

  edit: (id) ->
    <%= singular_name %> = @<%= plural_name %>.get(id)

    view = new <%= "#{view_namespace}.EditView(model: #{singular_name})" %>
    RootView.getInstance().setView view
