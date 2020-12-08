class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  
  with_options presence: true do
    validates :title
    validates :overview
    validates :video
    validates :user_id
  end
end
