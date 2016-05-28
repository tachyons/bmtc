module Bmtc
  class TTMC
    attr_reader :id, :name
    def initialize(options = {})
      @id = options['id']
      @name = options['ttmcName']
    end

    def self.all
      list = JSON.parse Bmtc.get('/passengerinfo/ttmclist').body
      list.map { |stop| BMTC::TTMC.new(stop) }
    end
  end
end
