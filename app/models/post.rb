class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  
  def favorited_by?(user)
    goods.exists?(user_id: user.id)
  end
  
  enum status: {published: 0, draft: 1}
  
end
