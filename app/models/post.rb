class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :content, presence: true
  validates :category_id, presence: true
end
