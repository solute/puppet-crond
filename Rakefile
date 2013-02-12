require 'puppet-lint/tasks/puppet-lint'
require 'rake'
require 'rspec/core/rake_task'

task :default => [:spec, :lint]

RSpec::Core::RakeTask.new(:spec) do |t|
      t.pattern = 'spec/*/*_spec.rb'
end
