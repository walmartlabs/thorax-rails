require 'test_helper'
require 'generators/generators_test_helper'
require "generators/thorax/router/router_generator"

class RouterGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Thorax::Generators::RouterGenerator

  test "simple router with two actions" do
    run_generator ["Posts", "index", "edit"]

    assert_file "#{thorax_path}/routers/posts.js.coffee" do |router|
      assert_match /class PostsRouter extends Backbone.Router/, router
    end

    %W{index edit}.each do |action|
      assert_file "#{thorax_path}/views/posts/#{action}_view.js.coffee"
      assert_file "#{template_path}/posts/#{action}.hbs"
    end
  end

  test "camelize router names containing two words" do
    run_generator ["BlogPosts", "index", "edit"]

    assert_file "#{thorax_path}/routers/blog_posts.js.coffee" do |router|
      assert_match /class BlogPostsRouter extends Backbone.Router/, router
    end

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