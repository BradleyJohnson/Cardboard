class Comment < ActiveRecord::Base
  validates :commentable_id, :commentable_type, :title, :body, :user_id, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
