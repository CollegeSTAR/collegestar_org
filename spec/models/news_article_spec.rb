RSpec.describe NewsArticle do

  describe "validations" do
    describe "feature_article" do
      context "not feature_article" do
        it { should_not validate_uniqueness_of(:feature_article) }
      end
      context "is feature_aticle" do
        subject do
          create(:news_article, feature_article: true)
        end
        it { should validate_uniqueness_of(:feature_article) }
      end
    end
  end
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

  describe "#order_by_created_date_and_limit" do
    it "returns a reverse date ordered list of articles" do
      @article_1 = create(:news_article)
      @article_2 = create(:news_article)
      expect(NewsArticle.order_by_created_date_and_limit).to eq([@article_2, @article_1])
    end
  end

  describe "#all_reverse" do
    let(:article_one) { create(:news_article) }
    let(:article_two) { create(:news_article) }
    it "returns a reverse date ordered list of all articles" do
    article_one
    article_two
      expect(NewsArticle.all_reverse).to eq([article_two, article_one])
    end
  end
end
