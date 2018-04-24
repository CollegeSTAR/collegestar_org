class Api::V1::SendgridEventsController < ApplicationController
  
  protect_from_forgery except: :create
  
  def create
    @event_post = SendgridEventPost.create( sendgrid_event_post_params )
    if @event_post.persisted?
      render json: JSON.generate({message: "SendGrid Event Post created."}), status: :created
    else
      response = {message: "SendGrid Event Post not created."}
      response.merge!( {errors: @event_post.errors.to_hash} )
      render json: JSON.generate(response), status: :unprocessable_entity
    end
  end
  
  private

  def sendgrid_event_post_params
    if params.has_key? :"_json"
      return { data: params.permit!.require(:_json).to_a }
    end
    return {}
  end
end
