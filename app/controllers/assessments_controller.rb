class AssessmentsController < ApplicationController
  before_action :set_udl_module
  
  def show
  end

  def edit
  end

  def update
    @udl_module.update( udl_module_params )
    redirect_to edit_udl_module_assessment_path(@udl_module)
  end

  private

  def set_udl_module
    @udl_module = UdlModule.find_by slug: params[:udl_module_slug]
  end

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
            :explanation,
            :position
          ]
        ]
      )
  end
end
