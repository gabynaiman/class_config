require 'coverage_helper'
require 'minitest/autorun'
require 'turn'
load File.expand_path('../../lib/class_config.rb', __FILE__)

Turn.config do |c|
  c.format = :pretty
  c.natural = true
end