require 'spec_helper'

describe Kurli do

  before(:each) do
    @server_mock = mock(Kurli::Server)
    @uri = 'http://example.com'
  end

  it "should initialize parser with required arguments" do
    Kurli::Server.should_receive(:new).with(@uri).and_return(@server_mock)
    kurli = Kurli::Kurli.new(@uri)
  end

end
