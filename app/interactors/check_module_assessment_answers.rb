class CheckModuleAssessmentAnswers
  include Interactor

  def call
    question_ids = get_question_ids
    assessment_score = 0
    question_count = question_ids.count
    context.questions = context.assessment_question_klass.where( id: question_ids)
    context.questions.each do |question|
      if question_correct?(question)
        mark_question_correct(question)
        assessment_score = increase_score(assessment_score, question_count)
      else
        mark_question_wrong(question)
      end
    end
    context.assessment.score = assessment_score
    context.assessment.save
  end

  private
  def get_question_ids
    question_ids = []
    JSON.parse(context.submitted_params[:questions_order]).each do |position, question|
      question_ids << question["id"].to_i
    end
    question_ids
  end

  def question_correct?(question)
    if context.submitted_params[:selected_answer_choices].values.include? question.correct_answer_choice_id.to_s
      return true
    end
    false
  end

  def mark_question_correct(question)
    association = question.user_assessment_question_associations.find_by user_module_assessment: context.assessment
    association.correct = true
    association.save
  end

  def mark_question_wrong(question)
    association = question.user_assessment_question_associations.find_by user_module_assessment: context.assessment
    association.correct = false
    association.save
  end

  def increase_score(assessment_score, question_count)
    question_value = 100 / question_count
    assessment_score += question_value
  end
end
