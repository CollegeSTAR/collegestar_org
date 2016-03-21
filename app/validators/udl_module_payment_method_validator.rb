class UdlModulePaymentMethodValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless options[:valid_payment_methods].include? value
      record.errors[:payment_method] << (options[:message] || "is not a valid payment method")
    end
  end
end
