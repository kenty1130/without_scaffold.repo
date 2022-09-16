class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :my_thread
  validates :body, presence: true
end
