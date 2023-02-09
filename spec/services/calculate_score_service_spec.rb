require 'rails_helper'

RSpec.describe CalculateScoreService, type: :service do
  subject { described_class.new }
  let!(:user) { create(:user) }
  let!(:post1) { create(:post, user_id: user.id) }
  let!(:post2) { create(:post, user_id: user.id) }
  let!(:comment1) { create(:comment, post_id: post1.id, user_id: user.id) }
  let!(:comment2) { create(:comment, post_id: post1.id, user_id: user.id, created_at: 2.days.before) }
  let!(:vote1) { create(:vote, post_id: post1.id, user_id: user.id) }
  let!(:vote2) { create(:vote, post_id: post1.id, user_id: user.id) }
  let!(:vote3) { create(:vote, post_id: post2.id, user_id: user.id) }


  describe '#execute' do
    context 'under similar created time, with more votes should has higer score' do
      it 'post1 score more than post2' do 
        subject.execute
        expect(post1.reload.score).to be > post2.reload.score
        expect(comment1.reload.score).to be > comment2.reload.score
      end
    end

    context 'the ealier of the created time of comment, with lower score' do
      it 'comment1 score more than comment2' do 
        subject.execute
        expect(comment1.reload.score).to be > comment2.reload.score
      end
    end
  end
end
