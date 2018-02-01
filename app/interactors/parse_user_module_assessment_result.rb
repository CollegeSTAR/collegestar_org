class ParseUserModuleAssessmentResult
  include Interactor

  def call
    context.score = context.assessment.score
    context.questions = parse_questions(context.assessment)
  end

  private

  def parse_questions(assessment)
    questions = []
    assessment.user_assessment_question_associations.includes(
      assessment_question: [:assessment_answer_choices]
    ).each do |assoc|
      parsed_question = AssessmentQuestionPresenter.new(
        association: assoc,
        question: assoc.assessment_question,
        answer_choices: assoc.assessment_question.assessment_answer_choices
      )
      questions << parsed_question
    end
    questions
  end
end
