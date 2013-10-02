class <%= model_namespace %> extends Model
  name: '<%= singular_table_name %>'
  urlRoot: '/<%= plural_table_name %>'

  defaults:
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null
<% end -%>


