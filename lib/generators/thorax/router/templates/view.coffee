class <%=view_namespace%><%=@action.camelize%>View extends <%= js_app_name %>.View
  name: "<%=plural_model_name%>/<%=@action%>",
  template: HandlebarsTemplates["<%= hbs @action %>"]
