# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.require :test

require 'minitest/autorun'
require 'lagunitas'

# Support files
Dir["#{__dir__}/support/*.rb"].sort.each do |file|
  require file
end

module Lagunitas
  class TestCase < MiniTest::Test
    include Lagunitas
  end
end
