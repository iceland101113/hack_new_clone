require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject { described_class.new(attributes) }
  let(:attributes) { attributes_for(:vote) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:post) }
  end

  describe '#save' do
    it { expect(subject.save).to be_truthy }
    it 'post votes_count increase'do 
      subject.save
      expect(subject.post.votes_count).to eq(1)
    end
  end
end
