class Article < ActiveRecord::Base
  attr_accessible :content, :excerpt, :title, :image

  mount_uploader :image, ImageUploader
end
