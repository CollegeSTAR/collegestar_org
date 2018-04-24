class Api::V1::SendgridEventsController < ApplicationController
  
  protect_from_forgery except: :create
  
  def create
    @event = SendgridEvent.create( sendgrid_event_params )
    if @event.persisted?
      render json: JSON.generate({message: "SendGrid Event created."}), status: :created
    elsif @event.errors.has_key? :sg_event_id
      render json: JSON.generate({message: "SendGrid Event already exists."}), status: :accepted
    else
      response = {message: "SendGrid Event not created."}
      response.merge!( {errors: @event.errors.to_hash} )
      render json: JSON.generate(response), status: :unprocessable_entity
    end
  end
  
  private

  def sendgrid_event_params
    #convert the hypened smtp-id so we can mass-assign
    params.merge!( { smtp_id: params["smtp-id"]} ) 
    params.permit(:sg_event_id, :sg_message_id, :event, :email, :smtp_id, :timestamp)
  end
end
