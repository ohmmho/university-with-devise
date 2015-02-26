
require 'benchmark'
require 'open-uri'

namespace :linkseed do
  desc "Seed cats database"
  task seed_link_db: :environment do
    @doc = Nokogiri::XML(open('http://www.tagoartwork.com/feed/'))
    @items = @doc.xpath('//item') 
    @items_title = @items.xpath('//item//title').map{|title| title.inner_text}
    @items_link = @items.xpath('//item//link').map{|link| link.inner_text}

    tago_link_title = @items_title.zip(@items_link)

    tago_link_title.each do |item| 
      Link.create(title: item.first, url: item.last, brand: "tago")
    end


    # dribbble

    @doc = Nokogiri::XML(open('https://dribbble.com/shots/popular.rss'))
    @drible_i = @doc.xpath('//item') 
    @drible_title =  @drible_i.xpath('//item//title').map{|title| title.inner_text}
    @drible_link = @drible_i.xpath('//item//link').map{|link| link.inner_text}
    @drible_img = @drible_i.map{|item| Nokogiri::HTML(item.children[3].children[1].content).xpath("//img").first["src"]}


    drible_link_title_img = @drible_title.zip(@drible_link, @drible_img)


    drible_link_title_img.each do |item|
      Link.create(title: item[0], url: item[1], img_url: item[2], brand: "drible")
    end


    # ffffound

    @doc = Nokogiri::XML(open('http://feeds.feedburner.com/ffffound/everyone'))
    @found_i = @doc.xpath('//item') 
    @found_title =  @found_i.xpath('//item//title').map{|title| title.inner_text}
    @found_link = @found_i.xpath('//item//link').map{|link| link.inner_text}
    @found_img = @found_i.xpath('//item//description').map{ |img| Nokogiri::HTML(img.inner_text).xpath("//img").first["src"] }

    found_link_title_img = @found_title.zip(@found_link, @found_img)

    found_link_title_img.each do |item|
      Link.create(title: item[0], url: item[1], img_url: item[2], brand: "found")
    end

      # behance 

      @doc = Nokogiri::XML(open('https://www.behance.net/feeds/projects'))
      @behance_i = @doc.xpath('//item')
      @behance_title = @behance_i.xpath('//item//title').map{ |title| title.inner_text }
      @behance_link = @behance_i.xpath('//item//link').map{ |title| title.inner_text }
      @behance_img = @behance_i.xpath('//item//description').map{ |img| Nokogiri::HTML(img.inner_text).xpath("//img").first["src"] }
      behance_link_title_img = @behance_title.zip(@behance_link, @behance_img)

      behance_link_title_img.each do |item|
        Link.create(title: item[0], url: item[1], img_url: item[2], brand: "behance")
      end

      #awards

      @doc = Nokogiri::HTML(open('http://feeds.feedburner.com/awwwards-sites-of-the-day'))
      @awards_i = @doc.xpath('//item') 
      @awards_link = @awards_i.xpath('//item//link').map {|link| link.next_sibling}
      @awards_img = @awards_i.children[3].children[1].xpath('//img').map{ |item| item['src'] }

      awards_link_img = @awards_link.zip(@awards_img)

      awards_link_img.each do |item|
        Link.create(url: item.first, img_url: item.last, brand: "awwwards")
      end
  end
end