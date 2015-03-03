class User < ActiveRecord::Base

  has_secure_password
  
  has_many :links, through: :clicked_links #links means links visited by the user#
  has_many :clicked_links

  validates :email, presence: true, uniqueness: true, email_format: { message: "it doesn't look like an email address" }

    

end
