require 'rspec/core/rake_task'
require 'rake'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["--color"]
end