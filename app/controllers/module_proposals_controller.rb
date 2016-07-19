class ModuleProposalsController < ApplicationController
  load_and_authorize_resource except: [:new, :create]
  before_action :set_module_proposal, only: [:show, :edit, :update, :destroy]
  def index
    @module_proposals = ModuleProposal.all
  end
  
  def new
    @module_proposal = ModuleProposal.new
  end

  def show
  end

  def edit
  end

  def create
    @module_proposal = ModuleProposal.new( module_proposal_params ) 
    @module_proposal.module_type = "new_module"
    if @module_proposal.save
      render :confirmation       
    else
      flash[:error] = @module_proposal.errors
      render :new
    end
  end

  def update
    if @module_proposal.update( module_proposal_params )
      redirect_to [:faculty, @module_proposal], notice: "Successfully updated module proposal."
    else
      flash[:error] = @module_proposal.errors
      render :edit
    end
  end

  def destroy
    @module_proposal.destroy
    flash[:notice] = "Successfully deleted module proposal."
    render :index 
  end
  
  private
    
    def set_module_proposal
      @module_proposal = ModuleProposal.find(params[:id])
    end

    def module_proposal_params
      params.require(:module_proposal).permit(:first_name, :last_name, :university, :department, :email, :module_type, :title, :description, :completion_date, :payment_method)
    end
end
