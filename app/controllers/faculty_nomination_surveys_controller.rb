class FacultyNominationSurveysController < ApplicationController
  before_action :set_campus
  before_action :set_faculty_nomination_survey, only: [ :show, :edit, :update, :destroy]

  def index
    @surveys = FacultyNominationSurvey.order( created_at: :desc).page params[:page]
    authorize @surveys
  end

  def show
    authorize @survey
  end

  def new
    @survey = FacultyNominationSurvey.new
    set_colleges
  end

  def create
    @survey = FacultyNominationSurvey.new( new_faculty_nomination_survey_params )
    @survey.institutional_faculty_id = InstitutionalFaculty.first.id #DB requires faculty, but we haven't implemented that yet.
    if @survey.save
      redirect_to confirmation_campus_faculty_nomination_survey_path(campus_slug: @campus.slug, id: @survey.id ), notice: "Successfully created nomination."
    else
      error_message = "The following fields cannot be blank: <br />".html_safe
      @survey.errors.each do |error|
        error_message += "#{error} <br />".humanize.html_safe
      end
      flash[:error] = error_message
      set_colleges
      render :new
    end
  end

  def edit
    authorize @survey
  end

  def update
    authorize @survey
    @survey.update( update_faculty_nomination_survey_params )
    redirect_to campus_faculty_nomination_surveys_path( campus_slug: @campus.slug), notice: "Successfully updated survey."
  end

  def confirmation
  end
 
  private

  def set_campus
    @campus = Campus.find_by slug: params[:campus_slug]
  end

  def set_colleges
    @colleges = InstitutionalCollege.order(:name)
  end

  def set_faculty_nomination_survey
    @survey = FacultyNominationSurvey.find params[:id]
  end

  def new_faculty_nomination_survey_params
    params.require(:faculty_nomination_survey).permit(
      :campus_id,
      :remain_anonymous,
      :share_name_with_faculty,
      :contact_for_more_info,
      :student_name,
      :student_email,
      :teaching_strategy,
      :strategy_description,
      :reasons_for_effectiveness,
      :faculty_first_name,
      :faculty_last_name,
      :department_id,
      :student_gender,
      :student_age,
      :student_dss_eligible,
      :student_currently_using_dss,
      :institutional_faculty_id,
      institutional_faculty_attributes: [
        :first_name,
        :last_name,
        :student_generated_email,
        :student_generated
      ]
    )
  end

  def update_faculty_nomination_survey_params
    params.require(:faculty_nomination_survey).permit(:quotes, :reviewed, :not_appropriate)
  end
end
