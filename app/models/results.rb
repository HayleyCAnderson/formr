class Results
  def initialize(params)
    @results = answer_ids(params)
  end

  def update_results!
    @results.each do |result|
      answer = Answer.find(result)
      answer.increase_count
      answer.save
    end
  end

  private

  def answer_ids(params)
    params[:survey].map { |_, value| value[:answer_id] }
  end
end
