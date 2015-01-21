class Comment < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

end
