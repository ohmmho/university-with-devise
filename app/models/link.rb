class Link < ActiveRecord::Base

  belongs_to :site
  has_many :users, through: :clicked_links
  has_many :clicked_links

  validates :url, uniqueness: true

end

