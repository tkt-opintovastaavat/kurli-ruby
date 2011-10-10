require 'spec_helper'

describe Kurli::Server do

  before(:each) do
    @path = 'http://example.com/kurli/'
    @server = Kurli::Server.new(@path)
  end

  it "should initialize server" do
    @server.should_not be_nil
  end

  it "should get json-data from server" do
    @json_string = '{foo: "bar"}'
    FakeWeb.register_uri(:get, @path, :body => @json_string)
    @server.get.should == @json_string
  end

end
