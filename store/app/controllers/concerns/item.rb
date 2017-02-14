class Item < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :title, :description, :price, presence: true
end