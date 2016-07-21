class RedesignSummaryAttachment < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: [
                                                                    "image/png",
                                                                    "image/gif",
                                                                    "image/jpeg",
                                                                    "application/pdf",
                                                                    "application/msword",
                                                                    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                                    "application/vnd.ms-excel",
                                                                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                                    "application/vnd.ms-powerpoint",
                                                                    "application/vnd.openxmlformats-officedocument.presentationml.presentation"
                                                                  ]}

end
