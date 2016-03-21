class Faculty::RedesignSummariesController < ApplicationController
  def new
    @redesign_summary = RedesignSummary.new
  end
end
