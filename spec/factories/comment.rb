FactoryBot.define do
  factory :comment, class: 'Comment' do
    content { 'This is a content' }
    user_id { create(:user).id }
    post_id { create(:post).id }
  end
end
