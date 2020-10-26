# frozen_string_literal: true

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
task default: :test

namespace :lint do
  desc 'Lint Ruby'
  task :ruby do
    system 'bundle exec rubocop --parallel --config .rubocop.yml'
  end

  desc 'Lint YAML'
  task :yaml do
    abort 'yamllint is not installed. Install it with `pip3 install yamllint`.' if `which yamllint`.chomp.empty?

    system 'yamllint -c .yamllint.yml .'
  end
end

desc 'Run all linters'
task lint: %i[lint:ruby lint:yaml]
