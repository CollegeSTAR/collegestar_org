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
  validate :registration_open_datetime_must_be_before_registration_close_datetime, if: :should_validate_datetimes?
  validate :registration_open_datetime_must_be_before_start_datetime, if: :should_validate_datetimes?
  validate :start_datetime_must_be_before_end_datetime, if: :should_validate_datetimes?

  def to_param
    slug
  end

  def registration_open_datetime_must_be_before_registration_close_datetime
    if registration_open_datetime > registration_close_datetime
      errors.add(:registration_open_datetime, "Must be before registration_close_datetime")
    end
  end

  def registration_open_datetime_must_be_before_start_datetime
    if registration_open_datetime > start_datetime
      errors.add(:registration_open_datetime, "Must be before event start_datetime")
    end
  end

  def start_datetime_must_be_before_end_datetime
    if start_datetime > end_datetime
      errors.add(:start_datetime, "Must be before event end_datetime")
    end
  end

  def should_validate_datetimes?
    registration_open_datetime && registration_close_datetime && start_datetime && end_datetime
  end

end
