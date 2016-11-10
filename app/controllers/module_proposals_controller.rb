class ModuleProposalsController < ApplicationController
  before_action :set_module_proposal, only: [:show, :edit, :update, :destroy]
  def index
    @module_proposals = ModuleProposal.all
    authorize @module_proposals
  end
  
  def new
    @page_content = Page.guaranteed_find slug: 'module-proposals-new'
    @module_proposal = ModuleProposal.new
    authorize @module_proposal
  end

  def show
    authorize @module_proposal
  end

  def edit
    authorize @module_proposal
  end

  def create
    @module_proposal = ModuleProposal.new( module_proposal_params ) 
    @module_proposal.module_type = "new_module"
    authorize @module_proposal
    if @module_proposal.save
      ModuleProposalMailer.confirmation(@module_proposal).deliver_now
      render :confirmation       
    else
      flash[:error] = @module_proposal.errors
      render :new
    end
  end

  def update
    authorize @module_proposal
    if @module_proposal.update( module_proposal_params )
      redirect_to @module_proposal, notice: "Successfully updated module proposal."
    else
      flash[:error] = @module_proposal.errors
      render :edit
    end
  end

  def destroy
    authorize @module_proposal 
    @module_proposal.destroy
    flash[:notice] = "Successfully deleted module proposal."
    render :index 
  end
  
  private
    
    def set_module_proposal
      @module_proposal = ModuleProposal.find(params[:id])
    end

    def module_proposal_params
      params.require(:module_proposal).permit(:first_name, :last_name, :university, :department, :email, :module_type, :title, :description, :start_date, :completion_date)
    end
end
