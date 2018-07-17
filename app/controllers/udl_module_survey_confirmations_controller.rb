class UdlModuleSurveyConfirmationsController < ApplicationController
  before_action :set_udl_module
  before_action :set_survey

  def show
  end

  private

  def set_udl_module
    @udl_module = UdlModule.find_by slug: params[:udl_module_slug]
  end

  def set_survey
    @udl_module_survey = UdlModuleSurvey.find params[:udl_module_survey_id]
  end
end
