module Bmtc
  class Route
    def self.search(_query)
    end

    def self.stops_by_route_id(route_id)
      JSON.parse(Bmtc.get("/tripdetails/routestop/routeid/#{route_id}").body)
    end

    def self.time_table(route)
      JSON.parse(Bmtc.get("/routetiming/timedetails/service/ord/routeno/#{route}/format").body)
    end
  end
end
