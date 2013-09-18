require 'generators/thorax/thorax_helpers'

module Thorax
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Thorax::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs thorax.js with a default folder layout in app/assets/javascripts/thorax"

      class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
                              :desc => "Skip Git ignores and keeps"

      def inject_thorax
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require underscore\n//= require backbone\n//= require handlebars\n//= require thorax\n"
        end
      end

      def create_dir_layout
        %W{routers models views templates}.each do |dir|
          empty_directory "app/assets/javascripts/thorax/#{dir}"
          create_file "app/assets/javascripts/thorax/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end

    end
  end
end
