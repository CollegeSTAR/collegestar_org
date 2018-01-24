class CaseStudyProposalsController < ApplicationController
  before_action :set_case_study_proposal, only: [:show, :edit, :update, :destroy]
  def index
    @pending_proposals = CaseStudyProposal.pending.order(created_at: :desc)
    @accepted_proposals = CaseStudyProposal.accepted.order(created_at: :desc)
    @denied_proposals = CaseStudyProposal.denied.order(created_at: :desc)
    authorize @pending_proposals
  end
  
  def new
    @page_content = Page.guaranteed_find slug: 'module-proposals-new'
    @proposal = CaseStudyProposal.new
    authorize @proposal
  end

  def show
    authorize @proposal
  end

  def edit
    authorize @proposal
  end

  def create
    @proposal = CaseStudyProposal.new( case_study_proposal_params ) 
    @proposal.module_type = "case_study"
    authorize @proposal
    if @proposal.save
      ModuleProposalMailer.confirmation(@proposal).deliver_now
      render :confirmation       
    else
      @page_content = Page.guaranteed_find slug: 'module-proposals-new'
      flash[:error] = @proposal.errors
      render :new
    end
  end

  def update
    authorize @proposal
    if params[:case_study_proposal][:update_status]
      if @proposal.update( update_case_study_proposal_status_params )
        redirect_to @proposal, notice: "Successfully updated case study proposal."
      else
        flash[:errors] = @proposal.errors.first
        render :show
      end
    else
      if @proposal.update( case_study_proposal_params )
        redirect_to @proposal, notice: "Successfully updated case study proposal."
      else
        flash[:errors] = @proposal.errors.first
        render :show
      end
    end
  end

  def destroy
    authorize @proposal 
    @proposal.destroy
    flash[:notice] = "Successfully deleted case study proposal."
    render :index 
  end
  
  private
    
    def set_case_study_proposal
      @proposal = CaseStudyProposal.find(params[:id])
    end

    def case_study_proposal_params
      params.require(:case_study_proposal).permit(
        :first_name, 
        :last_name, 
        :university, 
        :department, 
        :email, 
        :module_type, 
        :title, 
        :description, 
        :strategy_link, 
        :start_date, 
        :completion_date,
        :accepted,
        :denied
      )
    end

    def update_case_study_proposal_status_params
      params.require(:case_study_proposal).permit(:accepted, :denied)
    end
end
