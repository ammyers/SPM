require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'

RSpec.configure do |config|
	config.include FactoryGirl::Syntax::Methods	
end