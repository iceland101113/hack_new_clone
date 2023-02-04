# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  title          :string
#  link_url       :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  comments_count :integer
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, :as => :voteable
end
