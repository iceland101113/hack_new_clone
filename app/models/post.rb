# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  link_url       :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#  comments_count :integer          default(0)
#  votes_count    :integer          default(0)
#  score          :integer          default(0)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true
  validates :user, presence: true
  validate :link_url_or_content_exist

  def link_url_or_content_exist
    if link_url.blank? && content.blank?
      errors.add(:post, "link_url or content should exist")
    end
  end
end
