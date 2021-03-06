require 'generators/thorax/resource_helpers'

module Thorax
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      include Thorax::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates thorax views with associated templates for the provided model and actions"

      argument :actions, :type => :array, :default => [], :banner => "action action"

      RESERVED_JS_WORDS = %W{
        break case catch continue debugger default delete do else finally for
        function if in instanceof new return switch this throw try typeof var void while with
      }

      def validate_no_reserved_words
        actions.each do |action|
          if RESERVED_JS_WORDS.include? action
             raise Thor::Error, "The name '#{action}' is reserved by javascript " <<
                                "Please choose an alternative action name and run this generator again."
          end
        end
      end

      def create_view_files
         actions.each do |action|
           @action = action
           @view_path = File.join(thorax_path, "views", plural_name, "#{@action}.js.coffee")
           @hbs_path = File.join(template_path, plural_name, "#{@action}.hbs")

           template "view.coffee", @view_path
           template "template.hbs", @hbs_path
         end
      end

    end
  end
end