class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :post_id, presence: true
  validates :name, presence: true, if: 'user_id.nil?'
  validates :email, presence: true, if: 'user_id.nil?'

end
