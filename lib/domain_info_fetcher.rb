class DomainInfoFetcher
  HTTP_STATUS_SUCCESS = 200

  def initialize(args={})
    @domain = args.fetch(:domain, nil)
    @uri = (@domain) ? URI("https://www.whois.com/whois/#{@domain}") : nil
  end

  def fetch()
    response = Net::HTTP.start(@uri.host, @uri.port, use_ssl: @uri.scheme == 'https') do |http|
      http.request Net::HTTP::Get.new @uri
    end
    HTTP_STATUS_SUCCESS
  end
end
