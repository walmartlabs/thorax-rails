class <%=collection_namespace%>Collection extends <%= js_app_name %>.Collection
  name: '<%= plural_name %>'
  model: <%=model_namespace%>Model
  url: '/<%= plural_table_name %>'

do ->
  instance = null
  <%=collection_namespace%>Collection.getInstance = ->
    if not instance
      instance = new <%=collection_namespace%>Collection
    instance