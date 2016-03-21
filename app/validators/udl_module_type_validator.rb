class UdlModuleTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless options[:valid_module_types].include? value
      record.errors[attribute] << (options[:message] || "is not a valid module type")
    end
  end
end
