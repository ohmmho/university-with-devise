class LinksController < ApplicationController

  def home  
    @zipped_tago = import_rss('http://www.tagoartwork.com/feed/')
    @zipped_dribbble = import_rss_dribbble('https://dribbble.com/shots/popular.rss')
    @zipped_ffffound = import_rss_ffffound('http://feeds.feedburner.com/ffffound/everyone')
    @zipped_awwwards = import_rss_awwwards('http://feeds.feedburner.com/awwwards-sites-of-the-day')
    @zipped_behance = import_rss_behance('https://www.behance.net/feeds/projects')
  end



  private

  # OPTIMIZE  => need to refactor these methods 

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
    @items_sources2 = @items.xpath('//item//description').map{ |img| Nokogiri::HTML(img.inner_text).xpath("//img").first["src"] }
    @items_title.zip(@items_link, @items_sources2)
  end

  def import_rss_behance(url)
    @doc = Nokogiri::XML(open(url))
    @behance_i = @doc.xpath('//item')
    @behance_title = @behance_i.xpath('//item//title').map{|title|title.inner_text}
    @behance_link = @behance_i.xpath('//item//link').map{|title|title.inner_text}
    @behance_img = @behance_i.xpath('//item//description').map{ |img| Nokogiri::HTML(img.inner_text).xpath("//img").first["src"] }
    @behance_title.zip(@behance_link, @behance_img)
  end


# FIXME => not finding titles, but whatever: is almost working :D

  def import_rss_awwwards(url)
    @doc = Nokogiri::HTML(open(url))
    @awards_i = @doc.xpath('//item') 
    @awards_link = @awards_i.xpath('//item//link').map {|link| link.next_sibling}
    @awards_img = @awards_i.children[3].children[1].xpath('//img').map{ |item| item['src'] }

    @awards_link.zip(@awards_img)

  
  end
end
 
 











 