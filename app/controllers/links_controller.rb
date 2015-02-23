class LinksController < ApplicationController

  def home  
    @zipped_tago = import_rss('http://www.tagoartwork.com/feed/')
    @zipped_dribbble = import_rss_dribbble('https://dribbble.com/shots/popular.rss')
    

  end

  def import_rss

  end


  private
  def import_rss(url)
    @doc = Nokogiri::XML(open(url))
    @items = @doc.xpath('//item') 
    @items_title =  @items.xpath('//item//title').map{|title| title.inner_text}
    @items_link = @items.xpath('//item//link').map{|link| link.inner_text}
    @items_title.zip(@items_link)
    
  end

  def import_rss_dribbble(url)
    @doc = Nokogiri::XML(open(url))
    @items = @doc.xpath('//item') 
    @items_title =  @items.xpath('//item//title').map{|title| title.inner_text}
    @items_link = @items.xpath('//item//link').map{|link| link.inner_text}
    @img_sources = @items.map{|item| Nokogiri::HTML(item.children[3].children[1].content).xpath("//img").first["src"]}
binding.pry
    @items_title.zip(@items_link, @img_sources)
  end
end
 