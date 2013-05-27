class Twitter < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/
 
  def initialize(tagName, markup, tokens)
    super
 
    if markup =~ Syntax then
      @id = $1
    else
      raise "No Twitter username provided in the \"twitter\" tag"
    end
  end
 
  def render(context)
    "[#{@id}](http://twitter.com/#{@id})"
  end
 
  Liquid::Template.register_tag "twitter", self
end
