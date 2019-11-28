class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :macro

  validates :content, presence: true
end
