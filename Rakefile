require 'rspec/core/rake_task'

GEM_NAME = 'spunkmeyer'
spec = eval File.read("#{GEM_NAME}.gemspec")

task :install do
  sh %{gem build #{GEM_NAME}.gemspec}
  sh %{gem install #{GEM_NAME}-#{spec.version}.gem --no-ri --no-rdoc}
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--color'
end
