class FrequentlyAskedQuestion < ActiveRecord::Base
  
  validates_presence_of :question, :answer, :slug
end
