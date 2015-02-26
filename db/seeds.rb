# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

@doc = Nokogiri::XML(open(url))
@items = @doc.xpath('//item') 
@items_title =  @items.xpath('//item//title').map{|title| title.inner_text}
@items_link = @items.xpath('//item//link').map{|link| link.inner_text}
@items_title.zip(@items_link)