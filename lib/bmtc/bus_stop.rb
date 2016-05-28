module Bmtc
  class BusStop
    attr_reader :id, :name, :latitude, :longitude
    def initialize(options = {})
      @id = options['StopId']
      @name = options['StopName']
      @latitude = options['StopLat']
      @longitude = options['StopLong']
    end

    def self.search(query)
      list = JSON.parse Bmtc.get("/busstops/stopsearch/name/#{query}").body
      list.map { |stop| BMTC::BusStop.new(stop) }
    end

    def self.buses_in_stop(id)
      options = {
        'stopID' => id
      }
      JSON.parse(Bmtc.post_request('/itsstopwise/details', options))
    end

    def self.nearest_stop(latitude, longitude, radius = 2)
      Bmtc.get("/busstops/stopnearby/lat/#{latitude}/lon/#{longitude}/rad/#{radius}")
    end
  end
end
