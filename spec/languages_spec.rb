require 'spec_helper'
require 'liquid'
require 'jekyll/languages'
require 'jekyll'

describe Jekyll::Languages do
  before :all do
    File.delete("_config.yml") if File.exist?("_config.yml")
  end
  
  it "can sentencize an array into a readable sentence form" do
    string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples', 'bananas', 'cucumbers'])
    string.should match /(.*), (.*) and (.*)/
  end
  
  it "can sentencize an array with only one element" do
    string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples'])
    string.should eq "apples"
  end
  
  it "can sentencize an array with only two elements" do
    string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples', 'cucumbers'])
    string.should match /(.*) and (.*)/
  end
  
  it "can sentencize an empty array" do
    string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => [])
    string.should eq ""
  end
  
  describe "will pick up configuration from the Jekyll config file" do
    before :all do
      config = "jekyll_languages:\n  array_connector: \"och\"\n"
      begin
        file = File.open("_config.yml", "w")
        file.write(config)
      ensure
        file.close unless file.nil?
      end
    end
    
    after :all do
      File.delete("_config.yml") if File.exist?("_config.yml")
    end
    
    it "and can sentencize an array into a readable sentence form" do
      string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples', 'bananas', 'cucumbers'])
      string.should match /(.*), (.*) och (.*)/
    end
  
    it "and can sentencize an array with only one element" do
      string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples'])
      string.should eq "apples"
    end
  
    it "and can sentencize an array with only two elements" do
      string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => ['apples', 'cucumbers'])
      string.should match /(.*) och (.*)/
    end
  
    it "and can sentencize an empty array" do
      string = Liquid::Template.parse("{{ array | sentencize_array }}").render('array' => [])
      string.should eq ""
    end
  end
end