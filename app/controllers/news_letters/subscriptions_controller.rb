class NewsLetters::SubscriptionsController < ApplicationController

  def new
    @subscription = NewsLetterSubscription.new
  end

  def create
    @subscription = NewsLetterSubscription.create(subscription_params)
    if @subscription.persisted?
      flash[:notice] = 'News letter subscription successful.'
      redirect_to root_path
    else
      flash[:errors] = @subscription.errors.full_messages
      render :new
    end
  end

  private

  def subscription_params
    params.require(:news_letter_subscription).permit(
      :title,
      :first_name,
      :last_name,
      :email,
      :case_studies,
      :learning_communities,
      :research,
      :udl_in_higher_ed
    )
  end
end
