require 'test_helper'
require 'generators/generator_test_helper'
require "generators/thorax/scaffold/scaffold_generator"

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Thorax::Generators::ScaffoldGenerator
  arguments %w(Post title:string content:string)

  test "generate router scaffolding" do
    run_generator
  end
end