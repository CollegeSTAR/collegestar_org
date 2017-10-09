class CreateUdlModule
  include Interactor
  
  def call
    assessment_question = AssessmentQuestion.create
    udl_module = UdlModule.new( context.udl_module_params )
    udl_module.authors << context.user
    udl_module.released = false
    if context.params[:author_is_contributing_faculty]
      udl_module.faculty << context.user
    end

    if udl_module.save
      shared_sections = UdlModuleSection.shared_sections
      UdlModule::PAGES.each do |page|
        shared_sections[page].each do |section|
          udl_module.add_section( section )
        end
      end
      10.times do
        assessment_question = AssessmentQuestion.create(question:"Add your question here.")
        4.times do |i|
          answer_choice = AssessmentAnswerChoice.create(text: "Add your answer choice here.", position: i)
          assessment_question.assessment_answer_choices << answer_choice
        end
        udl_module.assessment_questions << assessment_question
      end
      context.udl_module = udl_module
    else
      context.fail!
    end
  end

  def rollback
    context.udl_module.destroy
  end
end
