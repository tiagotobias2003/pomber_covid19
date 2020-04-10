require "pomber_covid19/version"
require "httparty"

module PomberCovid19
  BASE_URL = "https://pomber.github.io/covid19/timeseries.json"

  def self.find_by_region_name(region_name)
    response = HTTParty.get(BASE_URL)
    raise HttpRequestError if response.code != 200

    covid19_data = response[region_name]
    raise RegionNotFoundError if covid19_data.nil?

    covid19_data
  end

  class HttpRequestError < StandardError
  end

  class RegionNotFoundError < StandardError
  end
end
