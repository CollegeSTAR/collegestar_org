class Api::V1::SendgridEventsController < ApplicationController
  
  protect_from_forgery except: :create
  
  def create
    render json: JSON.generate({message: "SendGrid Event created."}), status: :created
  end
end
