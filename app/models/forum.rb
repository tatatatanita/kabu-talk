class Forum < ApplicationRecord
  has_many :forum_users
  has_many :users, through: :forum_users
  has_many :posts
  validates :name, presence: true, uniqueness: true

  def show_last_post
    if (last_post = posts.last).present?
      if last_post.text?
        last_post.text
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
end