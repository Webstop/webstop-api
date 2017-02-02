require 'spec_helper'

describe WebstopApi::Configuration do

  describe '.api_key' do
    it 'should return default key' do
      WebstopApi.api_key.should == WebstopApi::Configuration::DEFAULT_API_KEY
    end
  end

  describe '.format' do
    it 'should return default format' do
      WebstopApi.format.should == WebstopApi::Configuration::DEFAULT_FORMAT
    end
  end

  describe '.method' do
    it 'should return default http method' do
      WebstopApi.method.should == WebstopApi::Configuration::DEFAULT_METHOD
    end
  end
end
