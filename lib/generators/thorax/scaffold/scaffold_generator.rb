require 'generators/thorax/model/model_generator'

module Thorax
  module Generators
    class ScaffoldGenerator < ModelGenerator

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"

      def create_router_files
        template 'router.coffee', File.join(thorax_path, "routers", class_path, "#{plural_name}_router.js.coffee")
      end

      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.coffee", File.join(thorax_path, "views", plural_name, "#{view}_view.js.coffee")
          template "templates/#{view}.hbs", File.join(thorax_path, "templates", plural_name, "#{view}.hbs")
        end

        template "views/model_view.coffee", File.join(thorax_path, "views", plural_name, "#{singular_name}_view.js.coffee")
        template "templates/model.hbs", File.join(thorax_path, "templates", plural_name, "#{singular_name}.hbs")
      end

      protected
        def available_views
          %w(index show new edit)
        end

    end
  end
end