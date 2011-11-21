require 'spec_helper'

describe Kurli do

  before(:each) do
    @server_mock = mock(Kurli::Server)
    @uri = 'http://example.com'
    Kurli::Server.should_receive(:new).with(@uri).and_return(@server_mock)
    @kurli = Kurli::Kurli.new(@uri)
  end

  it "should initialize parser with required arguments" do
    @kurli.should_not be_nil
  end

  it "should fetch courses" do
    course_data = '{"foo": "bar"}'
    course_mock = mock(Kurli::Course)
    courses_mock = [course_mock]
    parser_mock = mock(Kurli::Parser)

    @server_mock.should_receive(:get).and_return(course_data)
    Kurli::Parser.should_receive(:new).with(course_data).and_return(parser_mock)
    parser_mock.should_receive(:fetch_courses).and_return(courses_mock)
    @kurli.perform.should == courses_mock
  end

end
