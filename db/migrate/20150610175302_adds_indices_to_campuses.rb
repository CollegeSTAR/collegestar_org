class AddsIndicesToCampuses < ActiveRecord::Migration
  add_index :campuses, :name, { name: 'campuses_name_index', unique: true }
  add_index :campuses, :abbreviation, { name: 'campuses_abbreviation_index', unique: true }
  add_index :campuses, :slug, { name: 'campuses_slug_index', unique: true }
end
