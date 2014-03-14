require 'spec_helper'
require 'liquid'
require 'jekyll/languages'
require 'jekyll'

describe Jekyll::Languages do
  it "can sentencize an array into a readable sentence form" do
    Liquid::Template.parse("{{ array | sentencize_array }}").render( 'array' => ['apples', 'bananas', 'cucumbers'] ).should match /(.*), (.*) and (.*)/
  end
end