module Faculty::RedesignSummaryHelper
  def self.summary_content( summary )
    default_content = "<h3>Which course (faculty) did you redesign, or which aspect of your offerings (faculty & staff)?</h3><p></p>"
    default_content += "<h3>What was the technique you implemented in your redesign?</h3><p></p>"
    default_content += "<h3>Describe the ReDesign Process:</h3><p></p>"
    default_content += "<h3>Describe how you assessed the impact of your redesign, provide data if available:</h3><p></p>"
    default_content += "<h3>Provide examples related to your redesign, if available (eg videos, pics, assignment descriptions)</h3><p></p>"
    default_content += "<h3>Describe any challenges or barriers that you faced in your redesign.</h3><p></p>"
    summary.summary_content ||= default_content
  end
end
