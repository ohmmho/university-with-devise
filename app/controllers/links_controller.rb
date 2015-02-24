class LinksController < ApplicationController

  def home  
    @zipped_tago = import_rss('http://www.tagoartwork.com/feed/')
    @zipped_dribbble = import_rss_dribbble('https://dribbble.com/shots/popular.rss')
    @zipped_ffffound = import_rss_ffffound('http://feeds.feedburner.com/ffffound/everyone')
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
    @items_title.zip(@items_link, @img_sources)
  end

  def import_rss_ffffound(url)
    @doc = Nokogiri::XML(open(url))
    @items = @doc.xpath('//item') 
    @items_title =  @items.xpath('//item//title').map{|title| title.inner_text}
    @items_link = @items.xpath('//item//link').map{|link| link.inner_text}
    @items_sources2 = @items.xpath('//item//description').map{ |img|  Nokogiri::HTML(img.inner_text).xpath("//img").first["src"] }
    @items_title.zip(@items_link, @items_sources2)
  end
end
 
 # http://feeds.feedburner.com/ffffound/everyone
 # http://feeds.feedburner.com/awwwards-sites-of-the-day
 # https://www.behance.net/feeds/projects