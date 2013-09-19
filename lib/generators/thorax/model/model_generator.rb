require 'generators/thorax/thorax_helpers'

module Thorax
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Thorax::Generators::ThoraxHelpers

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a thorax model"

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def create_thorax_model
        template "model.coffee", "#{thorax_path}/models/#{file_name}.js.coffee"
      end

      def create_thorax_collection
        template "collection.coffee", "#{thorax_path}/collections/#{file_name}.js.coffee"
      end

    end
  end
end