class AddConstraintToEvents < ActiveRecord::Migration
    change_column_null :events, :name, false
    change_column_null :events, :registration_open_datetime, false
    change_column_null :events, :registration_close_datetime, false
    change_column_default :events, :max_registrants, 100
    change_column_null :events, :start_datetime, false
    change_column_null :events, :end_datetime, false
    change_column_null :events, :address, false
    change_column_null :events, :city, false
    change_column_null :events, :state, false
    change_column_null :events, :zip_code, false
end
