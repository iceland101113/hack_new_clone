class CalculateScoreService
  def execute
    [Post, Comment].each do |model|
      model.all.each do |object|
        score = calculate_score(object)
        object.update!(score: score*10000) 
      end
    end

  rescue StandardError => e
    Rails.logger.error "[Api::CalculateScoreService] ERROR:\n #{e.inspect}\n #{e.backtrace}"
  end

  private

  def calculate_score(object)
    time = (Time.current - object.created_at)/3600
    point = object.class == Post ? object.votes_count + 1 : 2
    (point - 1) / (time + 2)**1.5
  end
end
