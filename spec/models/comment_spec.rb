require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new(attributes) }
  let(:attributes) { attributes_for(:comment) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:post) }
  end

  describe '#save' do
    it { expect(subject.save).to be_truthy }
    it 'post comments_count increase'do 
      subject.save
      expect(subject.post.comments_count).to eq(1)
    end
  end
end
