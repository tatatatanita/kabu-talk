# 開発環境
- Ruby 2.5.1
- Rails 5.2.4.1

# kabu-talk DB設計

## usersテーブル
|Column|Type|Options|
|------|----|———|
|name|string|null: false, unique: true, index: true|
|email|string|null: false|
|password|string|null: false|
|text|text||
### Association
- has_many :posts
- has_many :predictions
- has_many :forum_users
- has_many :forums, through: :forum_users


## predictionsテーブル
|Column|Type|Options|
|------|----|———|
|stockname|string|null: false, index: true|
|buyorsell|integer|null: false|
|time|integer|null: false|
|text|text||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes_pred


## commentsテーブル
|Column|Type|Options|
|------|----|———|
|text|text|null: false|
|emotion|integer||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :prediction


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|text||
|user|references|null: false, foreign_key: true|
|forum|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :forum
- has_many :likes_posts


## forumsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
### Association
- has_many :posts
- has_many :forum_users
- has_many :forums, through: :forum_users


## forum_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|forum|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :forum


## likes-postsテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :post


## likes-predテーブル
|Column|Type|Options|
|------|----|-------|
|prediction|references|null: false, foreign_key: true|
### Association
- belongs_to :prediction