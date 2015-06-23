RSpec.describe NewsArticle do
  it "uses slug to look up articles" do
    @article = create(:news_article)
    expect(NewsArticle.find_by(slug: @article.slug)).to eq(@article)
  end

  it "is invalid without a title" do 
    @article = build(:news_article, title: nil)
    @article.valid?
    expect(@article.errors[:title].size).to eq(1)
  end

  it "is invalid without a unique title" do
    @article_1 = create(:news_article)
    @article_2 =  build(:news_article, title: @article_1.title)
    @article_2.valid?
    expect(@article_2.errors[:title].size).to eq(1)
  end

  it "is invlaid without a slug" do
    @article = build(:news_article, slug: nil)
    @article.valid?
    expect(@article.errors[:slug].size).to eq(1)
  end

  it "is invalid without a unique slug" do
    @article_1 = create(:news_article)
    @article_2 = build(:news_article, slug: @article_1.slug)
    @article_2.valid?
    expect(@article_2.errors[:slug].size).to eq(1)
  end

  it "is invlaid without content" do
    @article = build(:news_article, content: nil)
    @article.valid?
    expect(@article.errors[:content].size).to eq(1)
  end

  it "returns a reverse date ordered list of articles" do
    @article_1 = create(:news_article)
    @article_2 = create(:news_article)
    expect(NewsArticle.order_by_created_date_and_limit).to eq([@article_2, @article_1])
  end
end
