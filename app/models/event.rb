class Event < ActiveRecord::Base
  validates :name, presence: :true, uniqueness: :true
  validates :slug, presence: :true, uniqueness: :true
  validates :registration_open_datetime, presence: :true
  validates :registration_close_datetime, presence: :true
  validates :start_datetime, presence: :true
  validates :end_datetime, presence: :true
  validates :address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zip_code, presence: :true

  def to_param
    slug
  end
end
