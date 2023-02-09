FactoryBot.define do
  factory :vote, class: 'Vote' do
    user_id { create(:user).id }
    post_id { create(:post).id }
  end
end
