RSpec.describe NewsArticle, :type => :model do
  it "uses slug to look up articles" do
    @article = create(:news_article)
    expect(NewsArticle.find_by(slug: @article.slug)).to eq(@article)
  end

  it "is invalid without a title" do 
    expect(build(:news_article, title: nil)).to_not be_valid
  end

  it "is invalid without a unique title" do
    @article_1 = create(:news_article)
    expect(build(:news_article, title: @article_1.title)).to_not be_valid
  end

  it "is invlaid without a slug" do
    expect(build(:news_article, slug: nil)).to_not be_valid
  end

  it "is invalid without a unique slug" do
    @article_1 = create(:news_article)
    expect(build(:news_article, slug: @article_1.slug)).to_not be_valid
  end

  it "is invlaid without content" do
    expect(build(:news_article, content: nil)).to_not be_valid
  end

  it "returns a reverse date ordered list of articles" do
    @article_1 = create(:news_article)
    @article_2 = create(:news_article)
    expect(NewsArticle.order_by_created_date_and_limit).to eq([@article_2, @article_1])
  end
end
