require "bundler/gem_tasks"

# Compile tasks
require "rake/extensiontask"

Rake::ExtensionTask.new("rbshop") do |ext|
  ext.lib_dir = "lib/rbshop"
end

# Specs
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new("spec")

# Console
task :console do
  require 'irb'
  require 'irb/completion'
  require 'rbshop'

  include RBShop

  def img
    @img ||= Image.load('spec/fixtures/octocat.jpeg')
  end

  def preview
    img.save('/tmp/imagetmp.jpg')
    `open /tmp/imagetmp.jpg`
  end

  def reload!
    @img = nil
  end

  ARGV.clear

  IRB.start
end

# Documentation
require 'rdoc/task'

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/**/*.rb")
end

task :default => [:clean, :compile, :spec]
