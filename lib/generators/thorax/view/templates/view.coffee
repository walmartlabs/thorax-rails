<%=view_namespace%><%=@action.camelize%>View = View.extend
  name: "<%=view_namespace%>/<%=@action.camelize%>",
  template: HandlebarsTemplates["<%= hbs @action %>"]
