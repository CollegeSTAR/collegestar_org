class FacultyNominationSurveysController < ApplicationController
  before_action :set_campus
  before_action :set_faculty_nomination_survey, only: [ :show, :edit, :update, :destroy]

  def new
    @survey = FacultyNominationSurvey.new
  end
 
  private

  def set_campus
    @campus = Campus.find_by slug: params[:campus_slug]
  end

  def set_faculty_nomination_survey
    @survey = FacultyNominationSurvey.find_by slug: params[:slug]
  end
end
