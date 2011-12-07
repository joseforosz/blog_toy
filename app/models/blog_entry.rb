class BlogEntry < ActiveRecord::Base
  has_many :comments
  
end
