class MenuController < ApplicationController
  layout :false
  before_action :allow_iframe_requests

  def index
  end

  def allow_iframe_requests
    # response.headers.delete('X-Frame-Options', "ALLOWALL")
    # response.headers.add('Access-Control-Allow-Origin', '*')
    # response.headers.add('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
    # response.headers.add('Access-Control-Max-Age', "1728000")
    response.set_header('Access-Control-Allow-Origin', '*')
  end
end
