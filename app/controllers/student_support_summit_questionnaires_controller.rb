class StudentSupportSummitQuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show]
  
  def index
    @questionnaires = StudentSupportSummitQuestionnaire.all
    authorize @questionnaires
  end

  def show
    authorize @questionnaire
  end

  def new
    @questionnaire = StudentSupportSummitQuestionnaire.new
    authorize @questionnaire
  end

  def create
    @questionnaire = StudentSupportSummitQuestionnaire.new questionnaire_params
    authorize @questionnaire

    if @questionnaire.save
      redirect_to student_support_summit_path, notice: "Questionnaire submitted successfully, thank you!"
    else
      flash[:errors] = "There was an error processing your questionnaire, please try again."
      render :new
    end
  end

  private

  def set_questionnaire
    @questionnaire = StudentSupportSummitQuestionnaire.find params[:id]
  end

  def questionnaire_params
    params.require(:student_support_summit_questionnaire).permit(
      :first_name,
      :last_name,
      :email,
      :most_excited_about,
      :issues,
      :challenges,
      :well_spent_time
    )
  end

  def user_not_authorized
    flash[:errors] = "You are not authorized to view this area"
    redirect_to student_support_summit_path
  end
end
