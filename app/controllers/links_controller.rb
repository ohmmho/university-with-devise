class LinksController < ApplicationController

  def home  
    #link_rss
    @tagos = Link.where(brand: "tago").order("created_at desc")
    @brandemiasy = Link.where(brand: "brandemia").order("created_at desc")
    @mktdirectos = Link.where(brand:"marketingdirecto").order("created_at desc")
    @desarrollowebs = Link.where(brand: "desarrolloweb").order("created_at desc")
    @smashings = Link.where(brand: "smashingmagazine").order("created_at desc")

    #img_rss
    @dribles = Link.where(brand: "drible").order("created_at desc")
    @founds = Link.where(brand: "found").order("created_at desc")
    @behances = Link.where(brand: "behance").order("created_at desc")
    @awards = Link.where(brand: "awwwards").order("created_at desc")

  end

  def clicked
    link = Link.find(params[:url_id])
    unless ClickedLink.where(user_id: current_user.id, link_id: link.id).exists?
      current_user.links << link
    end
    redirect_to link.url
  end

  

end
 
 











 