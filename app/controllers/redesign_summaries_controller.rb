class RedesignSummariesController < ApplicationController
  before_action :set_redesign_summary, only: [:edit, :update]
  before_action :set_current_user
  load_and_authorize_resource

  def new
    @redesign_summary = RedesignSummary.new
    @redesign_summary.summary_content = Faculty::RedesignSummaryHelper.summary_content(@redesign_summary)
  end

  def index
    @redesign_summaries = RedesignSummary.where( user_id: @current_user.id )
  end

  def edit
  end

   def create
    @redesign_summary = RedesignSummary.new( create_redesign_summary_params )
    @redesign_summary.add_existing_attachments( attachment_klass: RedesignSummaryAttachment )
    @redesign_summary.user = @current_user
   
    if @redesign_summary.save
      flash[:notice] = "Redesign summary created successfully."
      redirect_to edit_profile_redesign_summary_path(profile_id: @current_user, id: @redesign_summary)
    else
      render :new
    end
  end 

  def update
    if @redesign_summary.update( redesign_summary_params )
      redirect_to edit_profile_redesign_summary_path(
                                                      profile_id: @current_user, 
                                                      id: @redesign_summary
                                                    ), notice: "Redesign summary saved successfully."
    else
      redirect_to edit_profile_redesign_summary_path(
                                              profile_id: @current_user,
                                              id: @redesign_summary
                                            ), notice: "Redesign summary could not be updated, you have errors in your summary."
    end
  end

  private

  def set_current_user
    current_user
  end

  def set_redesign_summary
    @redesign_summary = RedesignSummary.find(params[:id])
  end

  def create_redesign_summary_params
    params.require(:redesign_summary).permit( :uuid,
                                              :implemented_technique,
                                              :summary_content,
                                              :representation,
                                              :action_expression,
                                              :engagement
                                            )
  end

  def redesign_summary_params
    params.require(:redesign_summary).permit( :implemented_technique,
                                              :summary_content,
                                              :representation,
                                              :action_expression,
                                              :engagement
                                            )

  end
end
