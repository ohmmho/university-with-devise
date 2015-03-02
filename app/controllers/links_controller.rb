class LinksController < ApplicationController

  def home  
    
    @tagos = Link.where(brand: "tago").limit(10).order("created_at desc")
    @dribles = Link.where(brand: "drible").limit(10).order("created_at desc")
    @founds = Link.where(brand: "found").limit(10).order("created_at desc")
    @behances = Link.where(brand: "behance").limit(10).order("created_at desc")
    @awards = Link.where(brand: "awwwards").limit(10).order("created_at desc")
    
  end

  def clicked
    link = Link.find(params[:url_id])
    unless ClickedLink.where(user_id: current_user.id, link_id: link.id).exists?
      current_user.links << link
    end
    redirect_to link.url
  end

  

end
 
 











 