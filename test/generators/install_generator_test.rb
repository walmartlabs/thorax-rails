require 'test_helper'
require 'generators/generator_test_helper'
require "generators/thorax/install/install_generator"
require 'mocha'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Thorax::Generators::InstallGenerator

  def setup
    mkdir_p "#{destination_root}/app/assets/javascripts"
    cp fixture("application.js"), "#{destination_root}/app/assets/javascripts"
    Rails.application.class.stubs(:name).returns("Dummy::Application")

    super
  end

  test "Assert application coffeescript file is created" do
    run_generator

    assert_file "#{thorax_path}/dummy.js.coffee", /window\.Dummy/
  end

  test "Assert application coffeescript file is created for two word application name" do
    Rails.application.class.stubs(:name).returns("FooBar::Application")
    run_generator

    assert_file "#{thorax_path}/foo_bar.js.coffee", /window\.FooBar/
  end

  test "Assert application require is properly setup for two word application name" do
    Rails.application.class.stubs(:name).returns("FooBar::Application")
    run_generator

    assert_file "app/assets/javascripts/application.js", /require thorax\/foo_bar/
  end

  test "Assert thorax directory structure is created" do
    run_generator

    %W{routers models views templates}.each do |dir|
      assert_directory "#{thorax_path}/#{dir}"
      assert_file "#{thorax_path}/#{dir}/.gitkeep"
    end
  end

  test "Assert no gitkeep files are created when skipping git" do
    run_generator [destination_root, "--skip-git"]

    %W{routers models views templates}.each do |dir|
      assert_directory "#{thorax_path}/#{dir}"
      assert_no_file "#{thorax_path}/#{dir}/.gitkeep"
    end
  end

  test "Assert application.js require underscore, thorax, backbone, handlebars and dummy.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js" do |application|
      assert_match /require thorax\/dummy/, application

      %W{underscore backbone thorax handlebars}.each do |require|
        assert_match /#{require}/, application
      end
    end
  end

  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end

end