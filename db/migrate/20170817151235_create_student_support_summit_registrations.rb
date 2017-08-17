class CreateStudentSupportSummitRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :student_support_summit_registrations do |t|
      t.string :program_name
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :institution
      t.string :first_attendee_first_name
      t.string :first_attendee_last_name
      t.string :first_attendee_email
      t.string :first_attendee_phone
      t.string :first_attendee_address
      t.string :first_attendee_address_2
      t.string :first_attendee_city
      t.string :first_attendee_state
      t.string :first_attendee_zip
      t.text   :first_attendee_dietary_restrictions
      t.text   :first_attendee_accessability_needs
      t.string :second_attendee_first_name
      t.string :second_attendee_last_name
      t.string :second_attendee_email
      t.string :second_attendee_phone
      t.string :second_attendee_address
      t.string :second_attendee_address_2
      t.string :second_attendee_city
      t.string :second_attendee_state
      t.string :second_attendee_zip
      t.text   :second_attendee_dietary_restrictions
      t.text   :second_attendee_accessability_needs
    end
  end
end
