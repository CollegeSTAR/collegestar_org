class Role < ActiveRecord::Base
  validates :name, presence: true
  validates :action, presence: true
  validates :subject, presence: true
  has_many :access_controls
  has_many :users, through: :access_controls
  
  def apply_abilities( ability )
     ability.can action.to_sym, format_subject
  end

  private

  def format_subject
    if (subject == "all")
      return subject.to_sym
    else
      return subject.camelize.constantize
    end
  end
end
