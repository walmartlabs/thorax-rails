#= require thorax/models/<%= singular_table_name %>

class <%= collection_namespace %>Collection extends Thorax.Collection
  model: <%= model_namespace %>
  url: '<%= route_url %>'

