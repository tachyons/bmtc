require 'bmtc/version'
require 'bmtc/bus_stop'
require 'bmtc/ttmc'
require 'httparty'
BMTC = Bmtc
module Bmtc
  include HTTParty
  base_uri 'http://bmtcmob.hostg.in/api/'
  def self.post_request(path, options)
    Bmtc.post(path, body: options.to_json, headers: { 'Content-Type' => 'application/json' }).body
  end

  def self.route_details(route_no, direction = 'UP')
    options = {
      'direction' => direction,
      'routeNO' => route_no
    }
    Bmtc.post_request('/itsroutewise/details', options)
  end

  def self.route_map(route_no, direction = 'UP')
    options = {
      'direction' => direction,
      'routeNO' => route_no
    }
    Bmtc.post_request('/routemap/details', options)
  end

  def self.trip_fare(no_adults, service_type, source, _destination)
    options = {
      'adults' => no_adults.to_s,
      'destination' => source,
      'serviceType' => service_type,
      'source' => source
    }
    Bmtc.post_request('/tripfare/details', options)
  end
end
