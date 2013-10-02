<%=view_namespace%><%=@action.camelize%>View extends <%= js_app_name %>.View
  name: "<%=view_namespace%>/<%=@action.camelize%>",
  template: HandlebarsTemplates["<%= hbs @action %>"]
