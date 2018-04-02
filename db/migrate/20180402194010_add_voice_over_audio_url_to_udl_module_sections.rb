class AddVoiceOverAudioUrlToUdlModuleSections < ActiveRecord::Migration[5.1]
  def change
    add_column :udl_module_sections, :voiceover_audio, :string
  end
end
