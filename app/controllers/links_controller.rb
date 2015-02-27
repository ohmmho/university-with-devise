class LinksController < ApplicationController

  def home  
    @links = Link.all
    @tagos = @links.select{ |tago| tago.brand == "tago"}
    @dribles = @links.select { |drible| drible.brand == "drible"}
    @founds = @links.select {|found| found.brand == "found"}
    @behances = @links.select {|behance| behance.brand == "behance"}
    @awards = @links.select {|award| award.brand == "awwwards"}
  end



end
 
 











 