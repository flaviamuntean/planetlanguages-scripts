class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :macro
end
