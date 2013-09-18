# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "thorax"
  s.version = "0.0.0"
  s.authors     = ["Lauren Eastridge", "Formidable Labs", "Walmart Labs"]
  s.email       = ["ryan@codebrewstudios.com"]
  s.homepage    = "http://github.com/walmartlabs/backbone-rails"

  s.summary = "Use thorax.js with rails"
  s.description = "Add Thorax to the Rails asset pipeline.  Generators take care of boilerplate code so you don't have to"
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency('railties', '>= 3.1.0')
  s.add_dependency('coffee-script', '~> 2.2.0')
  s.add_dependency('jquery-rails', '~> 2.1.3')
  s.add_dependency('ejs', '~> 1.1.1')

  s.add_development_dependency('rails', '~> 3.2.0')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('uglifier')
  s.add_development_dependency('mocha', '~> 0.10.3')
  s.add_development_dependency('turn', '~> 0.8.3')
  s.add_development_dependency('minitest', '~> 2.10.1')

  s.require_paths = ['lib']
end
