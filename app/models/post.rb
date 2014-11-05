class Post < ActiveRecord::Base
  belongs_to :category
  default_scope { order('updated_at DESC').includes(:category) }
  validates :title, length: { maximum: 255 }, presence: true
  validates :category_id, presence: true
  enum post_type: [:link, :text]
end
