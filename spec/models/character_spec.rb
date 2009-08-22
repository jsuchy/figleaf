require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Character do
  it "should return a valid character" do
    weather = mock(Weather)
    Character.new(weather).should_not be nil
  end
end