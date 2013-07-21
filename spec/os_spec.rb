require 'spec_helper'

describe Spunkmeyer.os do

  it 'deects osx' do
    stub_const 'RbConfig::CONFIG', {'host_os' => 'darwin12.0.0' }
    Spunkmeyer.os.should == :osx
  end

  it 'deects linux' do
    stub_const 'RbConfig::CONFIG', {'host_os' => 'linux-gnu' }
    Spunkmeyer.os.should == :linux
  end

  it 'blows up on unrecognized os' do
    stub_const 'RbConfig::CONFIG', {'host_os' => 'snickerdoodle' }
    lambda { Spunkmeyr.os }.should raise_error
  end

end
