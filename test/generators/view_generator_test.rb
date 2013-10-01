require 'test_helper'
require 'generators/generators_test_helper'
require "generators/thorax/view/view_generator"

class ViewGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Thorax::Generators::ViewGenerator

  test "simple view with two actions" do
    run_generator ["Posts", "index", "edit"]

    %W{index edit}.each do |action|
      assert_file "#{thorax_path}/views/posts/#{action}_view.js.coffee"
      assert_file "#{template_path}/posts/#{action}.hbs"
    end
  end

  test "camelize router names containing two words" do
    run_generator ["BlogPosts", "index", "edit"]

    %W{index edit}.each do |action|
      assert_file "#{thorax_path}/views/blog_posts/#{action}_view.js.coffee"
      assert_file "#{template_path}/blog_posts/#{action}.hbs"
    end
  end

  test "raises an error when an action is a javascript reserved word" do
    content = capture(:stderr){ run_generator ["Posts", "new"] }
    assert_equal "The name 'new' is reserved by javascript Please choose an alternative action name and run this generator again.\n", content
  end

end