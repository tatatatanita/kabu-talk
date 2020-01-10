class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  # mount_uploader :image, ImageUploader
  validates :text, presence: true, unless: :image?
end