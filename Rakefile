require 'rspec/core/rake_task'
require 'parallel'
require 'rake'
require 'pry'
require 'pry-byebug'

task default: [:spec]
desc 'Run the specs.'
RSpec::Core::RakeTask.new(:rspec_smoke) do |t|
  t.pattern = Dir.glob('spec/')
  t.rspec_opts = '--tag @tag:smoke'
end
desc 'Run the specs.'
RSpec::Core::RakeTask.new(:rspec_regression) do |t|
  t.pattern = Dir.glob('spec/')
  t.rspec_opts = '--tag @tag:regression'
end

task smoke: :rspec_smoke
task regrassion: :rspec_regression

task :parallel do
  Parallel.map(%i[smoke regrassion], in_process: 2) do |task|
    Rake::Task[task].invoke
    raise Parallel::Break
  end
end
