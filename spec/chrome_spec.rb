require 'spec_helper'

module Spunkmayer
  module Chrome
    def self.cookie_path
      "#{File.expand_path File.dirname(__FILE__)}/fixtures/chrome.sqlite"
    end
  end
end

describe Spunkmayer::Chrome do

  it 'should grab cookies for a specified domain' do
    Spunkmayer::Chrome.cookies('https://foo.com').should == {
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

end
