require 'test_helper'
require 'generators/generators_test_helper'
require "generators/thorax/install/install_generator"
require 'minitest/unit'
require 'mocha'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Thorax::Generators::InstallGenerator

  def setup
    mkdir_p "#{destination_root}/app/assets/javascripts"
    cp fixture("application.js"), "#{destination_root}/app/assets/javascripts"
    Rails.application.class.stubs(:name).returns("Dummy::Application")

    super
  end


  test "Assert thorax directory structure is created" do
    run_generator

    %W{routers models views collections}.each do |dir|
      assert_directory "#{thorax_path}/#{dir}"
      assert_file "#{thorax_path}/#{dir}/.gitkeep"
    end
      assert_directory "#{template_path}"
      assert_file "#{template_path}/.gitkeep"
  end

  test "Assert no gitkeep files are created when skipping git" do
    run_generator [destination_root, "--skip-git"]

    %W{routers models views collections}.each do |dir|
      assert_directory "#{thorax_path}/#{dir}"
      assert_no_file "#{thorax_path}/#{dir}/.gitkeep"
    end
    assert_directory "#{template_path}"
    assert_no_file "#{template_path}/.gitkeep"
  end

  test "Assert application.js require underscore, backbone thorax etc." do
    run_generator

    assert_file "app/assets/javascripts/application.js" do |application|
      %W{underscore backbone thorax handlebars root view collection-view layout-view model collection}.each do |require|
        assert_match /#{require}/, application
      end
    end
  end

  test "Assert application.js require_tree ./models ./collections ./views etc." do
    run_generator

    assert_file "app/assets/javascripts/application.js" do |application|
      %W{ ../templates ./models ./collections ./views ./routers .}.each do |require_tree|
        assert_match /#{require_tree}/, application
      end
    end
  end

  test "Assert application class files are created" do
    run_generator

    assert_file "#{thorax_path}/collection-view.js.coffee"
    assert_file "#{thorax_path}/collection.js.coffee"
    assert_file "#{thorax_path}/layout-view.js.coffee"
    assert_file "#{thorax_path}/model.js.coffee"
    assert_file "#{thorax_path}/view.js.coffee"
    assert_file "#{thorax_path}/views/root.js.coffee"
    assert_file "#{template_path}/root.hbs"
  end


  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end

end