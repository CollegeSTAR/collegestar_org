class DssContactsController < ApplicationController
  before_action :set_dss_contact, only: [:show]

  def index
    @community_college_dss_contacts = DssContact.community_college
    @unc_dss_contacts = DssContact.unc
    @private_college_dss_contacts = DssContact.private_college
  end

  def show
  end

  private

  def set_dss_contact
    @dss_contact = DssContact.find_by slug: params[:slug]
  end
end
