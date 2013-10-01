class <%=view_namespace%><%=@action.camelize%>View extends View
  name: "<%=view_namespace%>/<%=@action.camelize%>",
  template: HandlebarsTemplates["<%= hbs @action %>"]
