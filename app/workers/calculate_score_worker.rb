class CalculateScoreWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0, queue: :scheduler

  def perform
    CalculateScoreService.new.execute
  end
end
