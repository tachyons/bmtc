module Bmtc
  class Bus
    def self.buses(origin,destination)
      options = {
        'endID' => destination,
        'startID' => origin
      }
      JSON.parse(Bmtc.post_request('/itstrips/details', options))
    end
  end
end
