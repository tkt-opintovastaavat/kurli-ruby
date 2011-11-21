require 'spec_helper'

describe Kurli::Parser do

  before(:each) do
    @kurli_course_mock = mock(Kurli::Course)
    @data_string = '[{"code": "582639", "name": {"fi": "Special Topics in Computational Geometry: Motion Planning and Shape Approxim","en": "Special Topics in Computational Geometry: Motion Planning and Shape Approximation","se": "Special Topics in Computational Geometry: Motion Planning and Shape Approximation"},"credits": "3","level": "L"}, {"code": "582658","name": {"fi": "Performance Modelling for Wireless Data Communication","en": "Performance Modelling for Wireless Data Communication","se": "Performance Modelling for Wireless Data Communication"},"credits": "2","level": "L"}, {"code": "582659","name": {"fi": "Software Factory Project","en": "Software Factory Project","se": "Software Factory Project"},"credits": "5","level": "L"}, {"code": "582336","name": {"fi": "Introduction to Go","en": "Introduction to Go","se": "Introduction to Go"},"credits": "3","level": "C"}]'
  end

  it "should parse data and return course objects" do
    parser = Kurli::Parser.new @data_string
    Kurli::Course.should_receive(:new).with(
                                            '582639',
                                            {
                                              :fi => 'Special Topics in Computational Geometry: Motion Planning and Shape Approxim',
                                              :en => 'Special Topics in Computational Geometry: Motion Planning and Shape Approximation',
                                              :se => 'Special Topics in Computational Geometry: Motion Planning and Shape Approximation'
                                            },
                                            '3',
                                            'L'
                                           ).and_return(@kurli_course_mock)
    Kurli::Course.should_receive(:new).with(
                                            '582658',
                                            {
                                              :fi => 'Performance Modelling for Wireless Data Communication',
                                              :en => 'Performance Modelling for Wireless Data Communication',
                                              :se => 'Performance Modelling for Wireless Data Communication'
                                            },
                                            '2',
                                            'L'
                                           ).and_return(@kurli_course_mock)
    Kurli::Course.should_receive(:new).with(
                                            '582659',
                                            {
                                              :fi => 'Software Factory Project',
                                              :en => 'Software Factory Project',
                                              :se => 'Software Factory Project'
                                            },
                                            '5',
                                            'L'
                                           ).and_return(@kurli_course_mock)
    Kurli::Course.should_receive(:new).with(
                                            '582336',
                                            {
                                              :fi => 'Introduction to Go',
                                              :en => 'Introduction to Go',
                                              :se => 'Introduction to Go'
                                            },
                                            '3',
                                            'C'
                                           ).and_return(@kurli_course_mock)
    parser.fetch_courses.should be_include(@kurli_course_mock)
  end

end
