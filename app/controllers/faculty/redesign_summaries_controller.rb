class Faculty::RedesignSummariesController < ApplicationController

  before_action :set_redesign_summary, only: [:show, :edit, :update]
  before_action :set_current_user
  load_and_authorize_resource
  
  def new
    @redesign_summary = RedesignSummary.new
    @redesign_summary.summary_content = Faculty::RedesignSummaryHelper.summary_content(@redesign_summary)
  end

  def index
    @redesign_summaries = RedesignSummary.all
  end

  def show
  end

  def edit
  end

  def create
    @redesign_summary = RedesignSummary.new( redesign_summary_params )
    @redesign_summary.add_existing_attachments( attachment_klass: RedesignSummaryAttachment )
    @redesign_summary.user = @current_user
   
    if @redesign_summary.save
      flash[:notice] = "Redesign summary created successfully."
      redirect_to edit_faculty_redesign_summary_path(@redesign_summary)
    else
      render :new
    end
  end

  def update
    if @redesign_summary.save
      flash[:notice] = "Redesign summary saved successfully."
    end
    redirect_to edit_faculty_redesign_summary_path(@redesign_summary)
  end

  private
  
  def set_current_user
    current_user
  end

  def set_redesign_summary
    @redesign_summary = RedesignSummary.find params[:id]
  end

  def redesign_summary_params
    params.require(:redesign_summary).permit( :uuid,
                                              :implemented_technique,
                                              :summary_content,
                                              :representation,
                                              :action_expression,
                                              :engagement
                                            )
  end
end
