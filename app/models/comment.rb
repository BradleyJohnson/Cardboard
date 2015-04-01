class Comment < ActiveRecord::Base
  validates :commentable_id, :commentable_type, :title, :body, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
