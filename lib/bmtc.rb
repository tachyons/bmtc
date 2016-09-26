require 'bmtc/version'
require 'bmtc/bus_stop'
require 'bmtc/ttmc'
require 'bmtc/bus'
require 'bmtc/route'
require 'httparty'
BMTC = Bmtc
module Bmtc
  SERVICE_TYPES = {
    ordinary: 1,
    vayu_vajra: 2,
    vajra: 3,
    atal_sarige: 5,
    nice_service: 11,
    bengaluru_darshini: 14

  }.freeze
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

  def self.trip_fare(_input_options = {})
    service_type = SERVICE_TYPES[_input_options[:service_type]] || _input_options[:service_type] || '1'
    source = _input_options[:source]
    destination = _input_options[:destination]
    no_adults = (_input_options[:no_adults].to_s || 1).to_s
    options = {
      'adults' => no_adults,
      'destination' => destination,
      'serviceType' => service_type,
      'source' => source
    }
    JSON.parse Bmtc.post_request('/tripfare/details', options)
  end
end
