module Thorax
  module Generators
    module ResourceHelpers

      def thorax_path
        "app/assets/javascripts/thorax"
      end

      def model_namespace
        [js_app_name, "Models", class_name].join(".")
      end

      def singular_model_name
        uncapitalize singular_name.camelize
      end

      def plural_model_name
        uncapitalize(plural_name.camelize)
      end

      def collection_namespace
        [js_app_name, "Collections", plural_name.camelize].join(".")
      end

      def view_namespace
        [js_app_name, "Views", plural_name.camelize].join(".")
      end

      def router_namespace
        [js_app_name, "Routers", plural_name.camelize].join(".")
      end

      def hbs(action)
        "thorax/templates/#{plural_name}/#{action}"
      end

      def js_app_name
        application_name.camelize
      end

      def application_name
        if defined?(Rails) && Rails.application
          Rails.application.class.name.split('::').first
        else
          "application"
        end
      end

      def uncapitalize(str)
        str[0, 1].downcase << str[1..-1]
      end

    end
  end
end