require 'spec_helper'
require 'liquid'
require 'jekyll/languages'
require 'jekyll'

describe Jekyll::Languages do
  it "can sentencize an array into a readable sentence form" do
    Liquid::Template.parse("{{ array | sentencize_array }}").render( 'array' => ['äpplen', 'päron', 'tomater'] ).should match /(.*), (.*) and (.*)/
  end
end