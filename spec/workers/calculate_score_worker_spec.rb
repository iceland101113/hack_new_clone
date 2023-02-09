require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe CalculateScoreWorker, type: :worker do
  describe 'testing worker' do
    it 'CalculateScoreWorker jobs are enqueued in the scheduled queue' do
      described_class.perform_async
      assert_equal :scheduler, described_class.queue
    end

    it 'goes into the jobs array for testing environment' do
      expect do
        described_class.perform_async
      end.to change(described_class.jobs, :size).by(1)
      described_class.new.perform
    end
  end
end