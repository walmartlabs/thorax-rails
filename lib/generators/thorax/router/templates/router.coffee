class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @<%=plural_name%> = new <%=collection_namespace%>Collection.getInstance()
    if !@<%=plural_name%>._fetched
      @<%=plural_name%>.fetch()
      @<%=plural_name%>._fetched = true

  routes:
  <% actions.each do |action| -%>
  "<%= action %>": "<%= action %>"
  <% end -%>

<% actions.each do |action| -%>
  <%= action %>: ->
    view = new <%= "#{view_namespace}#{action.camelize}View()" %>
    <%= js_app_name %>RootView.getInstance().setView view
<% end -%>
