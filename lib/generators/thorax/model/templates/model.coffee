class <%=model_namespace%>Model extends <%= js_app_name %>.Model
  name: '<%= singular_table_name %>'

  defaults:
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null
<% end -%>
