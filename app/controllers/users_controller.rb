class UsersController < ApplicationController

  def show

    @user = User.find(params[:id])
    @list_of_seenlinks = @user.links.order("created_at desc")
    # @date_links = clicked_links.where(user_id: @user.id).first.created_at.strftime("%B %d, %Y")

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end



# link.clicked_links.where(user_id: @user.id).first.created_at.strftime("%B %d, %Y")

   # <ul class="date list-unstyled"> <% link.clicked_links.where(user_id: @user.id).first.each do |date| %> 
   #  <%= date.created_at.strftime("%B %d, %Y") %>