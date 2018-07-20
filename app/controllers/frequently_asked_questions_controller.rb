class FrequentlyAskedQuestionsController < ApplicationController
  
  before_action :set_faq, only: [:edit, :update, :destroy]
  def index
    @faqs = FrequentlyAskedQuestion.all
    authorize( @faqs )
  end

  def new
    @faq = FrequentlyAskedQuestion.new
    authorize( @faq )
  end

  def create
    @faq = FrequentlyAskedQuestion.new frequently_asked_question_params
    authorize( @faq )
    @faq.slug = @faq.question.parameterize
    if @faq.save
      redirect_to frequently_asked_questions_path, notice: "Frequently Asked Question created successfully."
    else
      flash[:error] = "Could not create FAQ question."
      render :new
    end
  end

  def edit
    authorize( @faq )
  end

  def update
    authorize( @faq )
    @faq.update( frequently_asked_question_params )
    if @faq.persisted?
      redirect_to frequently_asked_questions_path, notice: "FAQ question successfully updated."
    else
      flash[:error] = "FAQ Question could not be updated."
      redirect_to edit_frequently_asked_question_path @faq
    end
  end

  def destroy
    authorize( @faq )
    if @faq.delete
      redirect_to frequently_asked_questions_path, notice: "FAQ question successfully deleted."
    else
      flash[:error] = "Could not delete question."
      redirect_to frequently_asked_question_path @faq
    end
  end

  private

  def set_faq
    @faq = FrequentlyAskedQuestion.find params[:id]
  end

  def frequently_asked_question_params
    params.require(:frequently_asked_question).permit(:question, :answer, :position)
  end

  def user_not_authorized
    if !current_user.id
      session[:user_return_to] = request.env['PATH_INFO']
      flash[:error] = "You must login to edit the FAQ section."
      redirect_to( login_path )
    else
      flash[:error] = "You are not authorized to edit the FAQ section."
      redirect_to( frequently_asked_questions_path )
    end

  end
end
