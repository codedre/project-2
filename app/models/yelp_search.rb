class YelpSearch
  attr_reader :businesses
  def initialize(query, paramas) #params is misspelled.
    response = Yelp.client.search(query, paramas)
    @businesses = response.businesses
  end
end
