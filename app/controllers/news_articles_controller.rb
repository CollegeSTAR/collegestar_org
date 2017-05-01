class NewsArticlesController < ApplicationController
  before_action :set_news_article, only: [:show, :edit, :update, :destroy]

  # GET /news_articles
  # GET /news_articles.json
  def index
    @news_articles = NewsArticle.non_featured_reverse_date_order.page( params[:page] ).per(10)
    @unreleased_news_articles = NewsArticle.unreleased
    authorize @news_articles
  end

  # GET /news_articles/1
  # GET /news_articles/1.json
  def show
    authorize @news_article
  end

  # GET /news_articles/new
  def new
    @news_article = NewsArticle.new
    authorize @news_article
  end

  # GET /news_articles/1/edit
  def edit
    authorize @news_article
  end

  # POST /news_articles
  # POST /news_articles.json
  def create
    @news_article = NewsArticle.new(news_article_params)
    @news_article.slug ||= @news_article.title.parameterize if @news_article.title
    authorize @news_article
    if @news_article.save
      redirect_to @news_article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /news_articles/1
  # PATCH/PUT /news_articles/1.json
  def update
    authorize @news_article
      if @news_article.update(news_article_params)
        redirect_to @news_article, notice: 'Successfully updated article.'
      else
        render :edit
      end
  end

  # DELETE /news_articles/1
  # DELETE /news_articles/1.json
  def destroy
    authorize @news_article
    @news_article.destroy
    redirect_to news_articles_path, notice: 'The Article was removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = NewsArticle.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_article_params
      params.require(:news_article).permit(:title, :content, :excerpt, :image_url, :released)
    end
end
