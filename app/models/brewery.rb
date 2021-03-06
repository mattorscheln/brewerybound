class Brewery < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :address }

  has_many :favorites , :class_name => "Favorite", :foreign_key => "brewery_id"
  has_many :users, :through => :favorites

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
