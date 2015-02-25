class User < ActiveRecord::Base

  has_secure_password
  has_many :links, through: :clicked_links
  has_many :clicked_links

  validates :email, presence: true, length: { in: 2..72 }

end
