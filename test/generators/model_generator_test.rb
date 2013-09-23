require 'test_helper'
require 'generators/generator_test_helper'
require "generators/thorax/model/model_generator"

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Thorax::Generators::ModelGenerator

  test "simple model" do
    run_generator %w(Post title:string content:string)

    assert_file "#{thorax_path}/models/post.js.coffee" do |model|
      model_class = Regexp.escape("class Dummy.Models.Post extends Thorax.Model")
      assert_match /#{model_class}/, model
      assert_match /paramRoot: 'post'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end

    assert_file "#{thorax_path}/collections/post.js.coffee" do |model|
      require_statement = Regexp.escape('/#= require thorax/models/post')
      collection_class = Regexp.escape('class Dummy.Collections.PostsCollection extends Thorax.Collection')
      assert_match /#{collection_class}/, model
      assert_match /url: '\/posts'/, model
    end
  end

  test "CamelCase a two-word model" do
    run_generator %w(BlogPost title:string content:string)

    assert_file "#{thorax_path}/models/blog_post.js.coffee" do |model|
      model_class = Regexp.escape("class Dummy.Models.BlogPost extends Thorax.Model")
      assert_match /#{model_class}/, model
      assert_match /paramRoot: 'blog_post'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end

    assert_file "#{thorax_path}/collections/blog_post.js.coffee" do |model|
      require_statement = Regexp.escape('/#= require thorax/models/blog_post')
      collection_class = Regexp.escape('class Dummy.Collections.BlogPostsCollection extends Thorax.Collection')
      assert_match /#{collection_class}/, model
      assert_match /url: '\/blog_posts'/, model
    end
  end
end