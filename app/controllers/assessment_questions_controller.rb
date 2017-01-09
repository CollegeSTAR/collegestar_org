class AssessmentQuestionsController < ApplicationController

  def update
    @udl_module = UdlModule.find_by( slug:  params[:udl_module_slug] )
    @udl_module.update udl_module_params
  end

  private

  def udl_module_params
    params.require(:udl_module).
    permit(
      assessment_questions_attributes: [
        :id,
        :question,
        :explanation,
        :udl_module_section_id,
        :ordered,
        :correct_answer_choice_id,
        assessment_answer_choices_attributes: [
          :id,
          :text,
          :position
        ]
      ]
    )
  end
end
