require 'test_helper'
require 'generators/generators_test_helper'
require "generators/thorax/model/model_generator"
require 'minitest/unit'

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Thorax::Generators::ModelGenerator

  test "simple model" do
    run_generator %w(Post title:string content:string)

    assert_file "#{thorax_path}/models/post.js.coffee" do |model|
      model_class = Regexp.escape("class PostModel extends Model")
      assert_match /name: 'post'/, model
      assert_match /urlRoot: '\/posts'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end

    assert_file "#{thorax_path}/collections/post.js.coffee" do |model|
      collection_class = Regexp.escape('class PostsCollection extends Collection')
      assert_match /name: 'posts'/, model
      assert_match /model: 'PostModel'/, model
    end
  end

  test "CamelCase a two-word model" do
    run_generator %w(BlogPost title:string content:string)

    assert_file "#{thorax_path}/models/blog_post.js.coffee" do |model|
      model_class = Regexp.escape("class BlogPostModel extends Model")
      assert_match /name: 'blog_post'/, model
      assert_match /urlRoot: '\/blog_posts'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end

    assert_file "#{thorax_path}/collections/blog_post.js.coffee" do |model|
      collection_class = Regexp.escape('class BlogPostsCollection extends Collection')
      assert_match /name: 'blog_posts'/, model
      assert_match /model: 'BlogPostModel'/, model
    end
  end
end