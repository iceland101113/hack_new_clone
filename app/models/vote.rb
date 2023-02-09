# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vote < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user
  validates :user, presence: true
  validates :post, presence: true
end
