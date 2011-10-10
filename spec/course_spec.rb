require 'spec_helper'

describe Kurli::Course do

  before(:each) do
    @code = '12345'
    @name = {:fi => 'suomi', :se => 'svenska', :en => 'english'}
    @credits = '6'
    @level = 'L'

    @course = Kurli::Course.new @code, @name, @credits, @level
  end

  it "should have code" do
    @course.code.should == @code
  end

  describe "name" do

    it "should be in Finnish" do
      @course.name(:fi).should == @name[:fi]
    end

    it "should be in Swedish" do
      @course.name(:se).should == @name[:se]
    end

    it "should be in English" do
      @course.name(:en).should == @name[:en]
    end

  end

  it "should have credits" do
    @course.credits.should == @credits
  end

  describe "level" do

    it "should know basic course" do
      course = Kurli::Course.new @code, @name, @credits, 'A'
      course.should be_basic
      course.should_not be_intermediate
      course.should_not be_advanced
      course.should_not be_other
    end

    it "should know intermediate course" do
      course = Kurli::Course.new @code, @name, @credits, 'C'
      course.should_not be_basic
      course.should be_intermediate
      course.should_not be_advanced
      course.should_not be_other
    end

    it "should know advanced course" do
      course = Kurli::Course.new @code, @name, @credits, 'L'
      course.should_not be_basic
      course.should_not be_intermediate
      course.should be_advanced
      course.should_not be_other
    end

    it "should know advanced course" do
      course = Kurli::Course.new @code, @name, @credits, 'O'
      course.should_not be_basic
      course.should_not be_intermediate
      course.should_not be_advanced
      course.should be_other
    end

  end

end
