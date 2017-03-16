class InstitutionalDepartmentsController < ApplicationController
  before_action :set_campus
  before_action :set_college
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

  def set_campus
    @campus = Campus.find_by slug: params[:campus_slug]
  end

  def set_college
    @college = InstitutionalCollege.find_by slug: params[:college_slug]
  end

  def set_department
    @department = InstitutionalDepartment.find_by slug: params[:slug]
  end
end
