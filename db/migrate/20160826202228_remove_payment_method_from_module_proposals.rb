class RemovePaymentMethodFromModuleProposals < ActiveRecord::Migration[5.0]
  def change
    remove_column :module_proposals, :payment_method
  end
end
