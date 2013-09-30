class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @<%=plural_name%> = new <%=collection_namespace%>Collection()
    @<%=plural_name%>.reset options.<%=plural_name%>

  routes:
  <% actions.each do |action| -%>
  "<%= action %>": "<%= action %>"
  <% end -%>

<% actions.each do |action| -%>
  <%= action %>: ->
    view = new <%= "#{view_namespace}#{action.camelize}View()" %>
    RootView.getInstance().setView view
<% end -%>
