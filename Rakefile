# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "thorax"
  gem.homepage = "http://github.com/walmartlabs/thorax-gem"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "eastridgele@gmail.com"
  gem.authors = ["Lauren Eastridge"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "thorax #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :thorax do
  desc "Download the latest releases of backbone, underscore, handlebars, and thorax"
  task :download_latest do
    files = {
      'underscore.js' => 'http://underscorejs.org/underscore.js',
      'backbone.js'  => 'http://backbonejs.org/backbone.js',
      'handlebars.js' => 'https://raw.github.com/wycats/handlebars.js/master/lib/handlebars.js',
      'thorax.js' => 'https://github.com/components/thorax/blob/master/thorax.js'
    }
    vendor_dir = "vendor/assets/javascripts/thorax"

    require 'open-uri'
    files.each do |local, remote|
      puts "Downloading #{local} from #{remote}"
      File.open "#{vendor_dir}/#{local}", 'w' do |f|
        f.write open(remote).read
      end
    end
  end
end

