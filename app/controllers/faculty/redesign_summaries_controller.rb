class Faculty::RedesignSummariesController < ApplicationController

  before_action :set_redesign_summary, only: [:show, :edit]
  before_action :set_current_user
  
  def new
    @redesign_summary = RedesignSummary.new
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
      render :confirmation
    else
      render :new
    end
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
