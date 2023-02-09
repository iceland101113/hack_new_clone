FactoryBot.define do
  factory :post, class: 'Post' do
    title { 'This is a title' }
    link_url { 'https://rails/testing.html' }
    content { 'This is a content' }
    user_id { create(:user).id }
  end
end
