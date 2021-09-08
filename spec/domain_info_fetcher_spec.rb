require 'spec_helper'
require 'domain_info_fetcher'

RSpec.describe DomainInfoFetcher do

  describe "#new" do
    it "instantiates" do
      expect(DomainInfoFetcher.new(domain: "domain.edu")).to be_instance_of(DomainInfoFetcher)
    end
  end

  describe "#fetch" do
    before(:each) do
      WebMock.allow_net_connect!(net_http_connect_on_start: true)
      stub_request(:get, 'https://www.whois.com/whois/domain.edu').
        to_return(body:"Test Mock", status: 200)
    end
    it "returns DomainInfoFetcher::HTTP_STATUS_SUCCESS on successful request" do
      domain_info = DomainInfoFetcher.new(domain: 'domain.edu')
      expect(domain_info.fetch).to eq(DomainInfoFetcher::HTTP_STATUS_SUCCESS)
    end
  end
end
