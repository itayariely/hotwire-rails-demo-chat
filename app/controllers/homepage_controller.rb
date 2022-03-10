class HomepageController < ApplicationController
  def index
    headers['X-Frame-Options'] = "ALLOWALL"
  end

end
