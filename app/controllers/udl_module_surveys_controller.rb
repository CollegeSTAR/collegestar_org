class UdlModuleSurveysController < ApplicationController
  
  before_action :set_udl_module

  def new
    @user_categories = UserCategory.selectable
    @udl_module_survey = UdlModuleSurvey.new(udl_module: @udl_module)
  end

  def create
    @udl_module_survey = UdlModuleSurvey.new survey_params
    @udl_module_survey.udl_module = @udl_module
    @udl_module_survey.save
    if @udl_module_survey.persisted?
      flash[:notice] = "Successfully completed survey!"
      redirect_to udl_module_udl_module_survey_survey_confirmation_path(
        udl_module_slug: @udl_module,
        udl_module_survey_id: @udl_module_survey.id
      )      
    else
      flash[:errors] = @udl_module_survey.errors.full_messages
      @user_categories
      render :new 
    end
  end

  private

  def set_udl_module
    @udl_module = UdlModule.find_by slug: params[:udl_module_slug]
  end

  def survey_params
    params.require(:udl_module_survey).permit(
      :length_of_time,
      :organization_of_module,
      :quality_of_content,
      :relevance_to_my_needs,
      :plan_to_implement,
      :likely_to_recommend,
      :access_another_module,
      :additional_feedback,
      user_category_ids: []
    )
  end
end
