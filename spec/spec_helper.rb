require 'rubygems'
require 'bundler/setup'
Bundler.require :default, :development

require 'kurli'

FakeWeb.allow_net_connect = false

RSpec.configure do |config|

  config.before(:each) do
    FakeWeb.clean_registry
  end

end
