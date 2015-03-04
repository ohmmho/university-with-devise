class Link < ActiveRecord::Base

  belongs_to :site
  has_many :users, through: :clicked_links
  has_many :clicked_links

  validates :url, uniqueness: true


  def self.get_links(url, brand)
    @doc = Nokogiri::XML(open(url))
    @items = @doc.xpath('//item') 
    @items_title = @items.xpath('//item//title').map{|title| title.inner_text}
    @items_link = @items.xpath('//item//link').map{|link| link.inner_text}

    tago_link_title = @items_title.zip(@items_link)

    tago_link_title.each do |item| 
      Link.create(title: item.first, url: item.last, brand: brand)
    end
  end

  def get_images(img_array, brand)
    #TODO
  end
end

