class User < ActiveRecord::Base

  has_secure_password
  
  has_many :links, through: :clicked_links
  has_many :clicked_links

  validates :email, presence: true, email_format: { message: "doesn't look like an email address" }

    

end
