class Api::V1::Faculty::RedesignSummaryAttachmentsController < ApplicationController
  
  def create
    @redesign_summary_attachment = RedesignSummaryAttachment.create(redesign_summary_attachment_params)
    if @redesign_summary = RedesignSummary.find_by(uuid: @redesign_summary_attachment.redesign_summary_uuid)
      @redesign_summary.attachments << @redesign_summary_attachment
      @redesign_summary.save
    end
    render nothing: true
  end

  private
  
  def redesign_summary_attachment_params
    params.require(:redesign_summary_attachment).permit(:attachment, :redesign_summary_uuid)
  end
end
