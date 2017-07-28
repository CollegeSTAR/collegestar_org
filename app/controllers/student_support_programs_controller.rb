class StudentSupportProgramsController < ApplicationController
  before_action :set_program, only: [:show]

  def new
    @student_support_program = StudentSupportProgram.new
  end

  def show
  end

  def create
    @student_support_program = StudentSupportProgram.new(student_support_program_params)
    @student_support_program.slug = @student_support_program.name.parameterize
    if @student_support_program.save
      redirect_to student_support_program_path( slug: @student_support_program.slug )
    else
      render :new
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
