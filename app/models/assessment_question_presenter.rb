class AssessmentQuestionPresenter
  attr_reader :question_text, :eplanation, :answer_choices, :selected_answer_choice_id, :correct_answer_choice_id

  def initialize(args={})
    @association = args.fetch(:association, nil)
    @question = args.fetch(:question, nil)
    @answer_choices = []
    @answer_choice_array = args.fetch(:answer_choices, [])

    order_answer_choices()
  end
  
  def question_text
    return @question.question
  end

  def explanation
    return @question.explanation
  end

  def selected_answer_choice_id
    return @association.selected_answer_id
  end

  def correct_answer_choice_id
    return @question.correct_answer_choice_id
  end

  def correct?
    return @association.correct
  end

  private

  def order_answer_choices
    if @association
      JSON.parse(@association.answer_choices).each do |choice|
        @answer_choices << @answer_choice_array.find(choice[1]["id"])
      end
    end
  end
end
