# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  score      :integer          default(0)
#
class Comment  < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  belongs_to :parent, class_name: 'Comment', optional: true 
  has_many :comments, foreign_key: :parent_id
  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
