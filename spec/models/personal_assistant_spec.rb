require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonalAssistant do
  it "should give us a valid character" do
    weather = mock(Weather)
    character = mock(Character)
    
    PersonalAssistant.should_receive(:dress_for).with(weather).and_return(character)
    
    PersonalAssistant.dress_for(weather).should == character
  end
end