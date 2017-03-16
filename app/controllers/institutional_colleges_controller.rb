class InstitutionalCollegesController < ApplicationController
  before_action :set_campus 
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  def index
    @units = InstitutionalCollege.where( campus_id: @campus.id ).order( :name )
  end

  def show
  end

  private

  def set_campus
    @campus = Campus.find_by slug: params[:campus_slug]
  end

  def set_college
    @college = InstitutionalCollege.find_by slug: params[:slug]
  end
end
