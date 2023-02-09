require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(attributes) }
  let(:attributes) { attributes_for(:post) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }

    let(:attributes) { attributes_for(:post, link_url: nil, content: nil) }
    it "is not valid without link_url and content" do
        expect(subject).to_not be_valid
    end
  end

  describe '#save' do
    it { expect(subject.save).to be_truthy }
  end
end
