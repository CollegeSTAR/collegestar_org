class StudentSupportProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update]

  def index
    @student_support_programs = StudentSupportProgram.all.order(name: "ASC")
  end

  def show
  end

  def new
    @student_support_program = StudentSupportProgram.new
    authorize @student_support_program
  end

  def create
    @student_support_program = StudentSupportProgram.new(student_support_program_params)
    authorize @student_support_program
    @student_support_program.slug = @student_support_program.name.parameterize
    if @student_support_program.save
      redirect_to student_support_program_path( slug: @student_support_program.slug )
    else
      render :new
    end
  end

  def edit
    authorize @student_support_program
  end

  def update
    authorize @student_support_program
    if @student_support_program.update(student_support_program_params)
      redirect_to student_support_program_path( slug: @student_support_program.slug ), notice: "Program successfully updated."
    else
      flash[:errors] = @student_support_program.errors
      render :edit
    end
  end

  private

  def set_program
    @student_support_program = StudentSupportProgram.find_by slug: params[:slug]
  end

  def student_support_program_params
    params.require(:student_support_program).permit(
      :name,
      :logo,
      :video_link,
      :mission_statement,
      :vision_statement,
      :description_of_services,
      :program_overview,
      :program_size,
      :resources,
      :contact_info,
      :public,
      :fee_based,
      :program_cost,
      :target_population_specified_ld,
      :target_population_adhd,
      :target_population_aut_asp,
      :target_population_efc,
      :target_population_other,
      :institution_size,
      :institution_type,
      :application_process
    )
  end
end
