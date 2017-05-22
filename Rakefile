require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

task :default => :acceptance

desc 'Run acceptance tests with serverspec'
task :acceptance => 'acceptance:all'
namespace :acceptance do
  targets = []
  roles = YAML.load_file('roles.yaml')
  roles.sort.each do |role, _|
    spec_file = "spec/roles/#{role}_spec.rb"
    targets << role if File.exist?(spec_file)
  end
  task :all => targets.map { |h| 'acceptance:' + h.split('.')[0] }
  roles.each do |role, hostname|
    spec_file = "spec/roles/#{role}_spec.rb"
    desc "Run serverspec for role #{role} on #{hostname}"
    RSpec::Core::RakeTask.new(role.to_sym) do |t|
      t.pattern = spec_file
      ENV['TARGET_HOST'] = hostname
    end
  end
end
