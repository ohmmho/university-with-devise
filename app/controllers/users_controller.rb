class UsersController < ApplicationController


  def show

    @user = User.find(params[:id])
    list_of_seenlinks = @user.clicked_links.order("created_at desc").includes(:link)

    @datehash = Hash.new([])

    list_of_seenlinks.each do |clicked_link|
      @datehash[clicked_link.created_at.strftime("%B %Y, %d")] << clicked_link
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end



# link.clicked_links.where(user_id: @user.id).first.created_at.strftime("%B %d, %Y")

   # <ul class="date list-unstyled"> <% link.clicked_links.where(user_id: @user.id).first.each do |date| %> 
   #  <%= date.created_at.strftime("%B %d, %Y") %>