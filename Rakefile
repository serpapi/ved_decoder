# frozen_string_literal: true

require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
end

namespace :proto do
  task :update do
    pid = Process.spawn('protoc', '--ruby_out=.', 'lib/ved_decoder/ved.proto')
    Process.wait pid
  end
end

task default: :test
