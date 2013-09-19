class <%= model_namespace %> extends Thorax.Model
  paramRoot: '<%= singular_table_name %>'

  defaults:
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null
<% end -%>


