class YelpSearch
  attr_reader :businesses
  def initialize(query, paramas)
    response = Yelp.client.search(query, paramas)
    @businesses = response.businesses
  end
end
