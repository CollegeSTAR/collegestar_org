class CaseStudyProposalsController < ApplicationController
  before_action :set_case_study_proposal, only: [:show, :edit, :update, :destroy]
  def index
    @proposals = CaseStudyProposal.order(created_at: :desc)
    authorize @proposals
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
    if @proposal.update( case_study_proposal_params )
      redirect_to @proposal, notice: "Successfully updated case study proposal."
    else
      flash[:error] = @proposal.errors
      render :edit
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
        :completion_date
      )
    end
end
