require 'spec_helper'

describe Spunkmeyer::Chrome do

  it 'should grab cookies for a specified domain' do
    Spunkmeyer::Chrome.stub(:cookie_path).and_return \
      "#{File.expand_path File.dirname(__FILE__)}/fixtures/chrome.sqlite"

    Spunkmeyer::Chrome.cookies('https://foo.com').should == {
      "some other name" => {
        :host_key => ".foo.com",
        :path => "/some/other/path",
        :name => "some other name",
        :value => "some other value",
        :expires_utc => 13017385153000000
      },
      "some name" => {
        :host_key => ".foo.com",
        :path => "/some/path",
        :name => "some name",
        :value => "some value",
        :expires_utc=>13017385153000000
      }
    }
  end

  it 'knows about osx' do
    Spunkmeyer.stub(:os).and_return :osx
    Spunkmeyer::Chrome.cookie_path.should == \
      "#{Dir.home}/Library/Application Support/Google/Chrome/Default/Cookies" 
  end

  it 'knows about linux' do
    Spunkmeyer.stub(:os).and_return :linux
    Spunkmeyer::Chrome.cookie_path.should == \
      "#{Dir.home}/.config/google-chrome/Default/Cookies"
  end

end
